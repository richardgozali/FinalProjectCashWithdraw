//
//  Model_Card_found.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import Foundation

struct Fund: Codable {
    var id = UUID()
    var idAccount: Int = 0
    var name: String = ""
    var nomorRekening: String = ""
    var saldo: Int = 0
    var pin: Int = 0
    enum CodingKeys: String, CodingKey {
        case idAccount = "id_account"
        case nomorRekening = "nomor_rekening"
        case saldo = "saldo"
        case pin = "pin"
        case name = "name"
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
