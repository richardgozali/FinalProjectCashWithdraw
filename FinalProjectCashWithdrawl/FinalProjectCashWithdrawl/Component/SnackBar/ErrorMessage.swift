//
//  ErrorMessage.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 27/06/22.
//

import SwiftUI

struct ErrorMessage: View {
    @Binding var selectedShow: Bool
    var title: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.red)
            HStack(spacing: 10) {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(SubTitleFontStyle().titleFont)
                Spacer()
            }.padding(.horizontal, 20)
        }
        .modifier(HiddenViewModifier(!selectedShow))
        .transition(AnyTransition.slide)
    }
}
