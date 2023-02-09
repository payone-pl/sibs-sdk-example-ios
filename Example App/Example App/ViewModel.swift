//
//  ViewModel.swift
//  Example App
//
//  Created by Marcin Kuswik on 09/02/2023.
//

import SibsSDK

final class ViewModel {
    enum Constants {
        static let defaultCurrencyCode = "PLN"
        static let tokenKey = "token"
    }

    // MARK: - Dependencies

    // data for sandbox
    let config = SDKConfig(
        baseURL: "https://stargate-cer.qly.site1.sibs.pt",
        webURL: "https://stargate-cer.qly.site1.sibs.pt",
        clientID: "502dfe94-5d7a-40e4-a707-e50cedda6c4b",
        token: "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJjODQxM2VmNC1iMDc1LTRhMGMtOWM5OS1lMDZlMDEzNDAxMmEifQ.eyJpYXQiOjE2NzA5NDQyMzYsImp0aSI6IjAxZDNhNDRjLTk0ZDgtNGY4Yi1hMmE0LWY4NzlmNDc1YjI4ZSIsImlzcyI6Imh0dHBzOi8vY2VyLnNpdGUxLnNzby5zeXMuc2licy5wdC9hdXRoL3JlYWxtcy9DRVIuU1BHLUlOVC5BUEkiLCJhdWQiOiJodHRwczovL2Nlci5zaXRlMS5zc28uc3lzLnNpYnMucHQvYXV0aC9yZWFsbXMvQ0VSLlNQRy1JTlQuQVBJIiwic3ViIjoiNTg5MTdlMWUtOTMxOC00ZmVhLWIzZjYtOTcwZDkyNTMxZGM4IiwidHlwIjoiT2ZmbGluZSIsImF6cCI6IkNFUi5TUEctSU5ULkFQSS1DTEkiLCJzZXNzaW9uX3N0YXRlIjoiZTNkYmNmMTYtNDdjOS00NTllLTk4ZTgtMTQ5MmQ5YTZiMGIyIiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBvZmZsaW5lX2FjY2VzcyBlbWFpbCJ9.farJCsVCx5wM-HMOuU7rAlthBa1Kg0BN01SGNdcB424.eyJtYyI6IjIxMiIsInRjIjoiMTgyIn0=.D7AF6CA6B2774F82E6F63EA52001291F621CA5902D2444C8EFC538F2DFDCF828",
        language: .pl
    )

    lazy var sdk: SDK = {
        SDK(config)
    }()
}

// MARK: - Token helpers

extension ViewModel {
    private var userDefaults: UserDefaults {
        UserDefaults.standard
    }

    var token: Token? {
        get {
            guard let data = userDefaults.object(forKey: ViewModel.Constants.tokenKey) as? Data else { return nil }
            return try? JSONDecoder().decode(Token.self, from: data)
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: ViewModel.Constants.tokenKey)
            }
        }
    }
}
