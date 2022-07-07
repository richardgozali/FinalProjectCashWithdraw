//
//  Funds.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 28/06/22.
//

import Foundation
import ObjectMapper
struct Fund: Codable {
    var id = UUID()
    var idAccount: Int = 0
    var name: String = ""
    var nomorRekening: String = ""
    var saldo: Int = 0
    var pin: Int = 0
    enum CodingKeys: String, CodingKey {
        case idAccount = "id_account"
        case name = "name"
        case nomorRekening = "nomor_rekening"
        case saldo = "saldo"
        case pin = "pin"
    }
}
extension Fund: Mappable {
    public init?(map: Map) { self.init() }
    public mutating func mapping(map: Map) {
        idAccount <- map["id_account"]
        name <- map["name"]
        saldo <- map["saldo"]
        nomorRekening <- map["nomor_rekening"]
        pin <- map["pin"]
    }
}
extension Fund: Equatable, Hashable {
    static func == (lhs: Fund, rhs: Fund) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
