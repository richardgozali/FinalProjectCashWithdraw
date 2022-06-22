//
//  CashWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct CashWithdraw: View {
    @State private var phoneNumber: String = ""
    @State private var selectedAmaount: String = ""
    @State private var pin: String = ""
    @State private var checkAmount : Decimal = 0.0
    @State private var selectedColors : String = ""
    var colors = ["Red", "Green", "Blue", "Tartan"]
    var fund : Fund
    var body: some View {
        NavigationView{
            VStack (spacing : 10){
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .shadow(radius: 20)
                    VStack(alignment: .leading, spacing: 20){
                        CustomTextField(
                            value: phoneNumber, title: "Phone Number",
                            placeHolder: "Insert Phone Number"
                        )
                        CustomPicker()
                        CustomTextField(
                            value: pin, title: "Withdrawal Pin",
                            placeHolder: "Create A 6 Pin to Withdraw a Cash"
                        )
                    }.padding(.all,30)
                }.padding(.top,20)
                    .frame(maxWidth: .infinity,  maxHeight: 350, alignment: .top)
                Spacer()
                ButtonView(buttonStyle: PrimaryButtonStyle(), label: "Continue")
                    .navigationBarHidden(true)
                
            }.padding([.horizontal] , 20)
            
        }.navigationBarTitle("", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Cash Withdraw").font(.headline)
                        Spacer()
                        Image(systemName: "clock.arrow.2.circlepath").padding(Edge.Set.vertical,20)
                            .foregroundColor(Color.blue)
                    }
                }
            }
        
        
    }
}

//struct CashWithdraw_Previews: PreviewProvider {
//    static var previews: some View {
//        CashWithdraw()
//    }
//}
