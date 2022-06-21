//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct ListFundCard: View {
    @State private var isActive : [Bool] = [false,true]
    @State private var listFund : [fund] = [fund(id: 1, nomorRekening: "091231123", nominalUang: 750000),fund(id :2 ,nomorRekening: "123122231", nominalUang: 900000)]
    @State private var sourceFund : fund = fund()
    
    @State private var navigationSelection : String? = nil
    
    private func onTapCard(fund: fund){
        navigationSelection = "CashWithdraw"
        sourceFund = fund
    }
    private func RenderLink() -> some View{
        NavigationLink(destination: CashWithdraw(fund: sourceFund), tag: "CashWithdraw", selection: $navigationSelection){EmptyView()}
    }
    private func RenderFundCard(fund : fund)-> some View{
        FundCard(fund: fund).onTapGesture {
            onTapCard(fund: fund)
        }
    }
    
    var body: some View {
        
        ScrollView(.horizontal){
            HStack(spacing: 20) {
                RenderLink()
                // multiple user view here
                ForEach(listFund) { fund in
                    RenderFundCard(fund: fund)
                }
            }
            .padding(.vertical, 10)
        }.padding([.horizontal] , 10)
        
        
    }
}

//struct ListFundCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ListFundCard()
//    }
//}
