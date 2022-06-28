//
//  SheetAmount.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct SheetAmount: View {
    @Binding var selectedAmount: Int
    var errorMsg: String = ""
    var isError: Bool = true
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Amount").font(.system(size: 16, weight: .bold, design: .serif)).foregroundColor(Color.black)
            HStack {
                if selectedAmount != 0 {
                    Text(
                        "Rp " + String(selectedAmount.withCommas())).font(.system(
                        size: 14,
                        weight: .light,
                        design: .serif
                        )
                    )
                }
                Spacer()
                Text("⌵")
                    .offset(y: -4)
            }.foregroundColor(Color.black)
            Divider().background(Color.black)
            Text(errorMsg)
                .foregroundColor(Color.red)
                .font(.system(size: 10, weight: .light, design: .serif))
                .modifier(HiddenViewModifier(isError))
        }
    }
}
