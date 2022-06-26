//
//  Model_Card_found.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import Foundation

struct Amount : Codable{
    var id = UUID()
    var idAmount: Int = 0
    var amount : Int = 0
    enum CodingKeys : String,CodingKey {
        case amount = "amount"
        case idAmount = "id_amount"
    }
    
}
extension Amount : Equatable, Hashable{
    static func == (lhs: Amount, rhs: Amount) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

