//
//  DetailHistoryToken.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 26/06/22.
//

import SwiftUI

struct DetailHistoryToken: View {
    @Binding var selectedHistoryToken: History
    @Binding var sourceNavigation: String?
    @Binding var sourceHistoryNavigation: String?
    var body: some View {
        NavigationCustomBar(
            title: "Detail History",
            isImage: false,
            navigationSelection: $sourceHistoryNavigation) {
                VStack {
                    if self.selectedHistoryToken.status == 1 {
                        ActiveDetailHistoryToken(
                            selectedHistoryToken: $selectedHistoryToken,
                            sourceHistoryNavigation: $sourceHistoryNavigation,
                            sourceNavigation: $sourceNavigation
                        )
                    } else {
                        CancelDetailHistoryToken(
                            selectedHistoryToken: $selectedHistoryToken,
                            navigationSelection: $sourceHistoryNavigation)
                    }
                }.onAppear {
                    print($sourceHistoryNavigation)
                }
        }
    }
}
