//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct ListFundCard: View {
    @State private var isActive : [Bool] = [false,true]
    @State private var listFund : [fund] = [fund(nomorRekening: "123122231", nominalUang: 900000),fund(nomorRekening: "123122231", nominalUang: 900000)]
    var body: some View {
        ScrollView(.horizontal){
           HStack(spacing: 15) {
              // multiple user view here
               ForEach(listFund) { fund in
                   FundCard(fund : fund)
               }

           }
           .padding(.all, 10)
        }
    
    }
}

struct ListFundCard_Previews: PreviewProvider {
    static var previews: some View {
        ListFundCard()
    }
}
