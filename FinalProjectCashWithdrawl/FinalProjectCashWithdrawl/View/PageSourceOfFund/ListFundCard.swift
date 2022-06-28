//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct ListFundCard: View {

    @State private var selectedFund: Fund = Fund()
    @Binding var sourceNavigation: String?
    @State private var isActiove: Int?
    @Binding var listFunds: [Fund]
    private func onTapCard(fund: Fund) {
        sourceNavigation = "CashWithdraw"
        selectedFund = fund
        isActiove = fund.idAccount
    }
    private func renderLink() -> some View {
        NavigationLink(
            destination: CashWithdraw(
                fund: $selectedFund,
                listFund: $listFunds,
                sourceNavigation: $sourceNavigation
            ),
            tag: "CashWithdraw",
            selection: $sourceNavigation) {EmptyView()}
    }
    private func renderFundCard(_ fund: Fund, _ active: Bool)-> some View {
        FundCard(fund: fund, isActive: active).onTapGesture {
            onTapCard(fund: fund)
        }
    }
    private func renderTitle(title: String, rekening: String) ->some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30, maxHeight: .infinity)
                    .foregroundColor(Color.blue)
                VStack(alignment: .leading, spacing: 5) {
                    Text(title).font(TitleCardFontStyle().titleFont)
                    Text("- "+rekening).font(SubTitleCardFontStyle().titleFont)
                }
            }
        }
    }
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                renderLink()
                // multiple user view her
                ForEach(listFunds, id: \.self) { fund in
                    renderTitle(title: fund.name, rekening: fund.nomorRekening)
                    if isActiove == fund.idAccount {
                        renderFundCard(fund, true).padding(.bottom, 20)
                    } else {
                        renderFundCard(fund, false).padding(.bottom, 20)
                    }
                }
            }
            .padding([.horizontal, .bottom], 10)
            .frame(alignment: .leading)
        }
    }
}

// struct ListFundCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ListFundCard()
//    }
// }
