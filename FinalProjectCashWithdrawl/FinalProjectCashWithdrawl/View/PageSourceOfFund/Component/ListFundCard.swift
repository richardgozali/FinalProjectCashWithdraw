//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct ListFundCard: View {
    @ObservedObject var viewModel: ViewModelSourceFund
    @State var selectedNavigation: String?
    var anayticManager = AnyliticManager()
    private func onTapCard(fund: Fund) {
        anayticManager.trackEvent(eventName: "VisitCashWithdraw", name: fund.name)
        viewModel.sourceNavigation = CashWithdrawCoordinator.name
        selectedNavigation = CashWithdrawCoordinator.name
        viewModel.selectedFund = fund
        viewModel.isActiove = fund.idAccount
    }
    private func renderLink() -> some View {
        CashWithdrawCoordinator(
            selectedNavigation: $selectedNavigation,
            fund: $viewModel.selectedFund,
            listFund: $viewModel.funds
        )
    }
    private func renderFundCard(_ fund: Fund, _ active: Bool) -> some View {
        FundCard(fund: fund, isActive: active).onTapGesture {
            onTapCard(fund: fund)
        }
    }
    private func renderTitle(title: String, rekening: String) -> some View {
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
                Spacer()
            }
        }
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                renderLink()
                // multiple user view her
                ForEach(viewModel.funds, id: \.self) { fund in
                    renderTitle(title: fund.name, rekening: fund.nomorRekening)
                    if viewModel.isActiove  == fund.idAccount {
                        renderFundCard(fund, true).padding(.bottom, 20)
                    } else {
                        renderFundCard(fund, false).padding(.bottom, 20)
                    }
                }
            }
            .padding([.horizontal, .bottom], 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
