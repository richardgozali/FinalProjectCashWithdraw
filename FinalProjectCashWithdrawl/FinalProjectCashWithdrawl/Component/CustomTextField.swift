//
//  CustomTextField.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct CustomTextField: View {
    @State var value  : String = ""
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]
    var section : Bool  = false
    var title:String = ""
    var placeHolder : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(title).font(.system(size: 16,weight : .bold, design: .serif))
            TextField(placeHolder, text: $value).font(.system(size: 14,weight : .light, design: .serif))
            Divider().background(Color.black)
        }
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField()
//    }
//}
