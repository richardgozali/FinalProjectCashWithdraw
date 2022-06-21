//
//  CashWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct CashWithdraw: View {
    @State private var name: String = ""
    var fund : fund
    var body: some View {
        NavigationView{
            VStack (spacing : 10){
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .shadow(radius: 20)
                    VStack(alignment: .leading, spacing: 20){
                        
                        Text("Phone Number")
                        TextField(fund.nomorRekening, text: $name)
                        Divider().background(Color.black)
                        
                        Text("Nomor Rekening")
                        TextField(fund.nomorRekening, text: $name)
                        Divider().background(Color.black)
                        
                        Text("Withdrawal Pin")
                        TextField("Create A 6 Pin to Withdraw a Cash", text: $name)
                        Divider().background(Color.black)
                       
                       
                        Spacer()
                    }.padding(.all,20)
                }.padding(.top,20)
                
                Group{
                    Button(action: {
                        print("tapped!")
                    }, label: {
                        Text("Continue")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(Color.green)
                            .cornerRadius(15)
                            .padding()
                    })
                }.frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .bottom)
                .navigationBarHidden(true)
            }.padding([.horizontal] , 20)
        }.navigationBarTitle("Cash Withdraw" , displayMode: .inline)
        
        
        
    }
}

//struct CashWithdraw_Previews: PreviewProvider {
//    static var previews: some View {
//        CashWithdraw()
//    }
//}
