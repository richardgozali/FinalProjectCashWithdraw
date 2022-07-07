//
//  ResponseHistory.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 30/06/22.
//

import Foundation
import ObjectMapper
struct ResponseAmount {
    var idResponse: String = ""
    var amount: [Amount] = []
}
extension ResponseAmount: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        amount <- map["data"]
        idResponse <- map["idresponse"]
    }
}
