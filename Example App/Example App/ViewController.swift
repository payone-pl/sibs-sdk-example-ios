//
//  ViewController.swift
//  Example App
//
//  Created by Marcin Kuświk on 30/11/2022.
//

import UIKit
import SibsSDK

final class ViewController: UIViewController {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var terminalIdTextField: UITextField!
    @IBOutlet weak var transactionIdTextField: UITextField!
    @IBOutlet weak var cardSwitch: UISwitch!
    @IBOutlet weak var blikSwitch: UISwitch!
    @IBOutlet weak var payByLinkSwitch: UISwitch!
    @IBOutlet weak var pblkvSwitch: UISwitch!
    @IBOutlet weak var clientTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    private enum Constants {
        static let defaultCurrencyCode = "PLN"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonAction(_ sender: Any) {
        startPayment()
    }

    private func startPayment() {
        guard let terminalIdString = terminalIdTextField.text,
              let terminalId = Int(terminalIdString),
              let transactionId = transactionIdTextField.text,
              let transactionDescription = descriptionTextField.text,
              let amountString = amountTextField.text,
              let amount = Double(amountString),
              let currency = Currency(code: currencyTextField.text ?? Constants.defaultCurrencyCode) else { return }

        var payments: [PaymentMethod] = []

        if cardSwitch.isOn {
            payments.append(.card)
        }
        if blikSwitch.isOn {
            payments.append(.blik)
        }
        if payByLinkSwitch.isOn {
            payments.append(.payByLink)
        }
        if pblkvSwitch.isOn {
            payments.append(.pblkv)
        }

        do {
            let data = try TransactionParams.Builder()
                .currency(currency)
                .amount(amount)
                .paymentMethods(payments)
                .terminalID(terminalId)
                .transactionID(transactionId)
                .transactionDescription(transactionDescription)
                .client(clientTextField.text ?? "")
                .email(emailTextField.text ?? "")
                .build()

            SIBS.startPayment(from: self, with: data) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.onPaymentSuccess(data: data)
                case .failure(let error):
                    self?.showAlert(withMessage: error.localizedDescription)
                }
            }
        } catch {
            showAlert(withMessage: error.localizedDescription)
        }
    }

    private func onPaymentSuccess(data: TransactionResult) {
        let message = String(
            format: NSLocalizedString("loc_status_alert_message", comment: ""),
            data.isSuccess ? NSLocalizedString("loc_status_alert_message_success", comment: "") : NSLocalizedString("loc_status_alert_message_error", comment: ""),
            data.transactionID ?? ""
        )
        showAlert(withTitle: NSLocalizedString("loc_status_alert_title", comment: ""), withMessage: message)
        checkStatus(transactionID: data.transactionID)
    }

    private func checkStatus(transactionID: String?) {
        guard let transactionID = transactionID else { return }
        SIBS.check(transactionID: transactionID) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Alert helper

extension ViewController {
    private func showAlert(withTitle title: String? = nil, withMessage message: String? = nil) {
        let alertAction = UIAlertAction(
            title: NSLocalizedString("loc_status_alert_action_title", comment: ""),
            style: .default
        )

        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alertViewController.addAction(alertAction)

        present(alertViewController, animated: true)
    }
}
