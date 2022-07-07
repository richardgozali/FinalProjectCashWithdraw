//
//  CancelDetailHistoryToken.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 27/06/22.
//

import SwiftUI

struct CancelDetailHistoryToken: View {
    @Binding var selectedHistoryToken: History
    @Binding var sourceHistoryNavigation: String?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 20) {
            Image("IconCancel")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .padding(.vertical, 20)
            Text("Cash Withdrawal Token Cancelled").font(TitleCardFontStyle().titleFont)
            Text("For cash withdrawal of IDR" + String(selectedHistoryToken.amount.withCommas()))
                .font(SubTitleFontStyle().titleFont)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
            ButtonCancel(
                buttonStyle: PrimaryButtonStyle(),
                label: "Done",
                action: {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
            Spacer()
        }.padding(.all, 20)
    }
}
