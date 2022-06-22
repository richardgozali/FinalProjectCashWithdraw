//
//  Model_Card_found.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import Foundation

struct Fund : Decodable,Identifiable,Hashable{
    var id: Int = 0
    var nomorRekening : String = ""
    var nominalUang : Int = 0;
}
