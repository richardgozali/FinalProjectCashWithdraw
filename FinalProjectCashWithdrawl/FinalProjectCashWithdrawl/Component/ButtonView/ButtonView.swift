//
//  ButtonView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct ButtonView: View {
    @State var buttonStyle : PrimaryButtonStyle
    var label : String = ""
    var action : ()->Void = {}
    var body: some View {
        Button(
            action: action ,
            label: {
                HStack{
                    Text(label)
                        .foregroundColor(buttonStyle.backgroundFontColor)
                        .font(buttonStyle.titleFontColor)
                        .frame(maxWidth: .infinity, maxHeight: 40 , alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)                    
                }
            })
    }
}
struct ButtonCancel: View {
    @State var buttonStyle : PrimaryButtonStyle
    var label : String = ""
    var action : ()->Void = {}
    var body: some View {
        Button(
            action: action ,
            label: {
                HStack{
                    Text(label)
                        .foregroundColor(buttonStyle.backgroundFontColor)
                        .font(buttonStyle.titleFontColor)
                        .frame(maxWidth: .infinity, maxHeight: 40 , alignment: .center)
                        .background(Color.red)
                        .cornerRadius(10)
                    
                }
            })
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}
