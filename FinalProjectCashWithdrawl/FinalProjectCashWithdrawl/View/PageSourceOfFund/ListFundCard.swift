//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct ListFundCard: View {

    @State private var selectedFund : Fund = Fund()
    
    @Binding var sourceNavigation : String?
    @State private var isActiove : Int? = nil
    var listFunds : [Fund]
   
    
    private func onTapCard(fund: Fund){
        sourceNavigation = "CashWithdraw"
        selectedFund = fund
        isActiove = fund.id_account
    }
    private func renderLink() -> some View{
        
        NavigationLink(destination: CashWithdraw(fund: $selectedFund,sourceNavigation: $sourceNavigation),
                       tag: "CashWithdraw", selection: $sourceNavigation){EmptyView()}
        
    }
    private func renderFundCard(_ fund : Fund,_ active: Bool)-> some View{
        FundCard(fund: fund,isActive: active).onTapGesture {
            onTapCard(fund: fund)
        }
    }
    private func renderTitle(title : String,rekening :String) ->some View{
        VStack(alignment: .leading, spacing: 10){
            Text(title).font(TitleCardFontStyle().titleFont)
            HStack{
                Image(systemName: "creditcard").foregroundColor(Color.blue)
                Text("- "+rekening).font(SubTitleCardFontStyle().titleFont)
                Spacer()
            }
        }
       
    }
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .leading, spacing: 10) {
                renderLink()
                // multiple user view her
                ForEach(listFunds, id: \.self) { fund in
                    renderTitle(title: fund.name,rekening: fund.nomor_rekening)
                    if isActiove == fund.id_account {
                        renderFundCard(fund,true).padding(.bottom,20)
                    }
                    else {
                        renderFundCard(fund,false).padding(.bottom,20)
                    }
                }
            }
            .padding([.horizontal,.bottom], 10)
            .frame(alignment: .leading)
        }
    }
}

//struct ListFundCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ListFundCard()
//    }
//}
