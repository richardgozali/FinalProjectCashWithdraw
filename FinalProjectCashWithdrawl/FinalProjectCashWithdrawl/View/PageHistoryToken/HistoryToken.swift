//
//  History.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//

import SwiftUI

struct HistoryToken: View {
    @Binding var sourceNavigation: String?
    @State var selectedHistoryToken: History = History()
    @State var sourceHistoryNavigation: String?
    @State var historytokens = [History]()
    private func renderLink() -> some View {
        NavigationLink(
            destination: DetailHistoryToken(
                selectedHistoryToken: $selectedHistoryToken,
                sourceNavigation: $sourceNavigation,
                sourceHistoryNavigation: $sourceHistoryNavigation
            ),
            tag: "DetailHistoryToken",
            selection: $sourceHistoryNavigation
        ) {EmptyView()}
    }
    private func loadData() {
        guard let data = JsonReader.loadDataFrom(filename: "History") else {
            return
        }
        do {
            self.historytokens = try JSONDecoder().decode([History].self, from: data)
            print(historytokens[0])
        } catch {
            print(error)
            return
        }
    }
    private func onMovePageDetailHistory(selectedHistoryToken: History) {
        self.sourceHistoryNavigation = "DetailHistoryToken"
        self.selectedHistoryToken = selectedHistoryToken
    }
    var body: some View {
        NavigationCustomBar(
            title: "Token History",
            isImage: false ,
            navigationSelection: $sourceNavigation
        ) {
            VStack {
                renderLink()
                Spacer().frame(height: 20)
                ScrollView(.vertical) {
                    ForEach($historytokens, id: \.self) { history in
                        CardHistoryToken(selectedHistory: history).onTapGesture {
                            onMovePageDetailHistory(selectedHistoryToken: history.wrappedValue)
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            loadData()
        }
    }
}
