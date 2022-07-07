//
//  ResponseHistory.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 30/06/22.
//

import Foundation
import ObjectMapper
struct ResponeHistory {
    var idResponse: String = ""
    var history: [History] = []
}
extension ResponeHistory: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        history <- map["data"]
        idResponse <- map["idresponse"]
    }
}
