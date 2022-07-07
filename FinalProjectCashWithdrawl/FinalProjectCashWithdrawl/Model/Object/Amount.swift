//
//  Model_Card_found.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import Foundation
import ObjectMapper
struct Amount: Codable {
    var id = UUID()
    var idAmount: String = "0"
    var amount: Int = 0
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case idAmount = "id_amount"
    }
}
extension Amount: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        idAmount <- map["id_amount"]
        amount <- map["amount"]
    }
}
extension Amount: Equatable, Hashable {
    static func == (lhs: Amount, rhs: Amount) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
