//
//  CustomTextField.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var value: String
    var isError: Bool  = true
    var title: String = ""
    var placeHolder: String = ""
    var errorMassage: String = ""
    var limitText: Int = 6
    func limitText(_ upper: Int = 6) {
        if value.count > upper {
            value = String(value.prefix(upper))
        }
        print(value)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title).font(.system(size: 16, weight: .bold, design: .serif))
            TextField(placeHolder, text: $value).font(.system(size: 14, weight: .light, design: .serif))
                .keyboardType(.numberPad)
            Divider().background(Color.black)
            Text(errorMassage)
                .foregroundColor(Color.red)
                .font(.system(size: 10, weight: .light, design: .serif))
                .modifier(HiddenViewModifier(isError))
                .onChange(of: value, perform: { _ in
                    limitText(limitText)
                })
        }
    }
}
