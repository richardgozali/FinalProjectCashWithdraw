//
//  ContentView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct SourceOfFund: View {
    var body: some View {
        VStack{
            Text("Source Of Funds")
                .padding()
                .font(.system(size: 20,design: .serif))
           ListFundCard()
            Text("Source Of Funds")
                .padding()
                .font(.system(size: 20,design: .serif))
            Spacer()
            
        }
        .padding([.horizontal],20)
        
    }
}


struct SourceOfFund_Previews: PreviewProvider {
    static var previews: some View {
        SourceOfFund()
    }
}
