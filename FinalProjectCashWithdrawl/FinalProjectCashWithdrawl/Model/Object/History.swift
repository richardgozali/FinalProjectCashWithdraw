//
//  History.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 24/06/22.
//

import Foundation
import ObjectMapper
struct History: Codable {
    var id = UUID()
    var idHistory: Int = 0
    var phoneNumber: String = ""
    var date: String = ""
    var amount: Int = 0
    var status: Int = 0
    var pin: String = ""
    var time: String = ""
    enum CodingKeys: String, CodingKey {
        case phoneNumber  = "phone_number"
        case date = "date"
        case amount = "amount"
        case status = "status"
        case pin = "pin"
        case time = "time"
    }
}
extension History: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        idHistory <- map["id_history"]
        phoneNumber <- map["phone_number"]
        date <- map["date"]
        amount <- map["amount"]
        status <- map["status"]
        pin <- map["pin"]
        time <- map["time"]
    }
}
extension History: Hashable, Equatable {
    static func == (lhs: History, rhs: History) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
