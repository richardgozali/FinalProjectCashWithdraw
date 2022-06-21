//
//  ContentView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct SourceOfFund: View {
    var body: some View {
        NavigationView{
            
            VStack (spacing : 20){
                
                ListFundCard()
                Spacer()
                .navigationBarTitle("Source Of Funds" , displayMode: .inline)
            }
        }
        
    }
}


//struct SourceOfFund_Previews: PreviewProvider {
//    static var previews: some View {
//        SourceOfFund()
//    }
//}
