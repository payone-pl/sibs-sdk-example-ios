//
//  ReturnStatus.swift
//  Example App
//
//  Created by Marcin Kuświk on 04/12/2022.
//

import Foundation

extension SIBS {
    public struct ReturnStatus: Codable {
        let statusCode, statusMsg, statusDescription: String
    }
}
