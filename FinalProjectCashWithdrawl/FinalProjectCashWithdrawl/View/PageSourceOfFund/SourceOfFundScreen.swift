//
//  ContentView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI
struct SourceOfFund: View {
    @ObservedObject var viewModel = ViewModelSourceFund()
    var body: some View {
        ZStack {
            ProgressView(R.string.localizable.engLoading())
                .foregroundColor(Color.blue)
                .modifier(HiddenViewModifier(!viewModel.isLoading))
                VStack(alignment: .leading, spacing: 10) {
                    NavigationCustomBar(
                        title: R.string.localizable.engTitle(),
                        isImage: false,
                        callBack: {return}) {
                            HStack {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text(R.string.localizable.engSubtitleSource())
                                        .multilineTextAlignment(.center)
                                        .font(SubTitleFontStyle().titleFont)
                                        .padding(.leading, 20)
                                    ListFundCard(
                                        viewModel: viewModel
                                    )
                                    Spacer()
                                }
                                Spacer()
                            }.padding([.horizontal, .vertical], 10)
                        }
            }.modifier(HiddenViewModifier(viewModel.isLoading))
        }
    }
}
