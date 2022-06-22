//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct ListFundCard: View {
     @State private var listFund : [Fund] = [Fund(id: 1, nomorRekening: "091231123", nominalUang: 750000),Fund(id :2 ,nomorRekening: "123122231", nominalUang: 900000),Fund(id :3 ,nomorRekening: "123412122", nominalUang: 29000000)]
    @State private var selectedFund : Fund = Fund()
    
    @State private var navigationSelection : String? = nil
    @State private var isActiove : Int? = nil
    
    private func onTapCard(fund: Fund){
        navigationSelection = "CashWithdraw"
        selectedFund = fund
        isActiove = fund.id
    }
    private func renderLink() -> some View{
    
        NavigationLink(destination: CashWithdraw(fund: selectedFund), tag: "CashWithdraw", selection: $navigationSelection){EmptyView()}
        
    }
    private func renderFundCard(_ fund : Fund,_ active: Bool)-> some View{
        FundCard(fund: fund,isActive: active).onTapGesture {
            onTapCard(fund: fund)
        }
    }
    
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 10) {
                renderLink()
                // multiple user view here
                
                ForEach(listFund) { fund in
                    if isActiove == fund.id {
                        renderFundCard(fund,true)
                    }
                    else {
                        renderFundCard(fund,false)
                    }
                }
            }
            .padding(.vertical, 10)
        }.padding([.horizontal] , 20)
        
        
    }
}

//struct ListFundCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ListFundCard()
//    }
//}
