//
//  History.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//
import SwiftUI
import Alamofire
import AlamofireObjectMapper
struct HistoryToken: View {
    @Binding var sourceNavigation: String?
    @ObservedObject var viewModel = ViewModelHistoryToken()
    private func renderLink() -> some View {
        NavigationLink(
            destination: DetailHistoryToken(
                selectedHistoryToken: $viewModel.selectedHistoryToken,
                sourceNavigation: $sourceNavigation,
                sourceHistoryNavigation: $viewModel.sourceHistoryNavigation
            ),
            tag: "DetailHistoryToken",
            selection: $viewModel.sourceHistoryNavigation
        ) {EmptyView()}
    }
    var body: some View {
        ZStack {
            renderLink()
            ProgressView("Loading")
                .foregroundColor(Color.blue)
                .modifier(HiddenViewModifier(viewModel.isLoading))
            NavigationCustomBar(
                title: "Token History",
                isImage: false,
                callBack: {}
            ) {
                VStack {
                    Spacer().frame(height: 20)
                    ScrollView(.vertical) {
                        ForEach(viewModel.historytokens, id: \.self) { history in
                            CardHistoryToken(selectedHistory: history).onTapGesture {
                                viewModel.onTapSelectedCard(selectedHistoryToken: history)
                            }
                        }
                    }
                    Spacer()
                }
            }.modifier(HiddenViewModifier(!viewModel.isLoading))
        }
    }
}
