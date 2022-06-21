//
//  FundCard.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct FundCard: View {
    var fund : fund
    var isActive : Bool = true
    var body: some View {
        ZStack {
            if isActive {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .shadow(radius: 5)
            }
            else{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(
                        Color.black, lineWidth: 2)
            }
            VStack(spacing: 10) {
                HStack {
                    Text(fund.nomorRekening)
                        .font(.system(size: 14,design: .serif))
                        .foregroundColor(.black)
                  
                    Spacer()
                }
                HStack {
                    Text("Balance")
                        .font(.system(size: 14,design: .serif))
                        .foregroundColor(.gray)
              
                    Spacer()
                }
                HStack {
                    Text(String(fund.nominalUang))
                        .font(.system(size: 15,design: .serif))
                        .foregroundColor(.black)
                    Spacer()
                }
                
            }
            .padding([.horizontal],20)
            
        }
        .frame(width: 150, height: 100)
    }
}

//struct FundCard_Previews: PreviewProvider {
//    static var previews: some View {
//        FundCard(fund: fund(id: 1, nomorRekening: "1231211", nominalUang: 900000))
//    }
//}
