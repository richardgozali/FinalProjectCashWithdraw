//
//  ResponseFund.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 28/06/22.
//

import Foundation
import ObjectMapper
struct ResponseFund {
    var idResponse: String = ""
    var fund: [Fund] = []
}
extension ResponseFund: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        fund <- map["data"]
        idResponse <- map["idresponse"]
    }
}
