//
//  ContentView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI
import Alamofire
struct SourceOfFund: View {
    @State private var sourceNavigation: String?
    @State private var funds = [Fund]()
    @State private var selectedFund: Fund = Fund()
    @State private var isActiove: Int?
    @State private var isLoading: Bool = true
    private func fetchData() {
        let request = AF.request(baseUrl + "Account")
        request.responseDecodable(of: [Fund].self) { (data) in
            funds =  data.value ?? []
            isLoading = false
        }
    }
    private func loadData() {
        guard let data = JsonReader.loadDataFrom(filename: "Fund") else {
            return
        }
        print("masuk")
        do {
            self.funds = try JSONDecoder().decode([Fund].self, from: data)
            print(funds[0])
        } catch {
            print(error)
            return
        }
    }
    var body: some View {
        ZStack {
            ProgressView("Loading")
                .foregroundColor(Color.blue)
                .modifier(HiddenViewModifier(!isLoading))
            NavigationView {
                VStack(alignment: .leading, spacing: 10) {
                    NavigationCustomBar(
                        title: R.string.localizable.engTitle(),
                        isImage: false,
                        navigationSelection: $sourceNavigation
                    ) {
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Text(R.string.localizable.engSubtitleSource())
                                    .multilineTextAlignment(.center)
                                    .font(SubTitleFontStyle().titleFont)
                                    .padding(.leading, 20)
                                ListFundCard(
                                    sourceNavigation: $sourceNavigation,
                                    listFunds: $funds
                                )
                                Spacer()
                            }
                            Spacer()
                        }.padding([.horizontal, .vertical], 10)
                    }
                }
            }.modifier(HiddenViewModifier(isLoading))
        }
        .onAppear {
            fetchData()
        }
    }
}
