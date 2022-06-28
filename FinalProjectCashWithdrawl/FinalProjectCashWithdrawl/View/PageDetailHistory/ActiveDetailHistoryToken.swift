//
//  ActiveDetailHistoryToken.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 27/06/22.
//

import SwiftUI

struct ActiveDetailHistoryToken: View {
    @Binding var selectedHistoryToken: History
    @Binding var sourceHistoryNavigation: String?
    @Binding var sourceNavigation: String?
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("IconMoney")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
            Text("Cash Withdrawal Token").font(TitleFontStyle().titleFont)
            Text("Input The 6-digit token below to the ATM screen to withdraw cash.")
                .font(SubTitleFontStyle().titleFont)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
            ZStack {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color.white)
                    .shadow(radius: 5)
                HStack {
                    Text(selectedHistoryToken.pin)
                        .font(TitleFontStyle().titleFont)
                }
            }.frame(maxHeight: 40)
            Text("This token is for the withdrawal of IDR"
                 + "\n"  +
                 String(self.selectedHistoryToken.amount.withCommas())
                 + "\n Valid Until :"
            ).font(SubTitleFontStyle().titleFont)
             .foregroundColor(Color.gray)
             .multilineTextAlignment(.center)
            Text(self.selectedHistoryToken.date
                 + " " + ":" + " " +
                 self.selectedHistoryToken.time).font(TitleCardFontStyle().titleFont)
            Spacer()
            ButtonView(
                buttonStyle: PrimaryButtonStyle(),
                label: "Done", action: {
                    sourceNavigation = nil
                }
            )
            ButtonCancel(
                buttonStyle: PrimaryButtonStyle(),
                label: "Cancel Withdraw", action: {
                    sourceHistoryNavigation = nil
                }
            )
            Spacer()
        }.padding(.all, 20)
    }
}
