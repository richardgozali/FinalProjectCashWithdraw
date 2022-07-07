//
//  paramTransactionPin.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 30/06/22.
//

import Foundation

struct TransactionPinParam {
    var phoneNumber: String = ""
    var pin: String = ""
    var amount: Int = 0
    var selectedFund: Fund = Fund()
}
