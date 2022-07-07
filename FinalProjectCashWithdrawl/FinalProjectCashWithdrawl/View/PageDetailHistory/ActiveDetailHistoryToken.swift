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
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("IconMoney")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
            Text(R.string.localizable.engCashwithdrawTitle()).font(TitleFontStyle().titleFont)
            Text(R.string.localizable.engCashwithdrawltokenPin())
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
            Text(R.string.localizable.engActivecashwithdrawlSubtitle(
                String(self.selectedHistoryToken.amount.withCommas()))
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
//                    sourceHistoryNavigation = nil
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
            Spacer()
        }.padding(.all, 20)
    }
}
