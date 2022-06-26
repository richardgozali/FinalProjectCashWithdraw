//
//  CardHistoryToken.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 26/06/22.
//

import SwiftUI

struct CardHistoryToken: View {
    @Binding var selectedHistory: History
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 5)
            HStack{
                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30, maxHeight: .infinity)
                    .clipped()
                    .padding(.leading,10)
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(selectedHistory.phoneNumber).font(TitleCardFontStyle().titleFont)
                        Spacer()
                        Text(String(selectedHistory.amount.withCommas())).font(SubTitleCardFontStyle().titleFont)
                        
                    }
                    HStack{
                        if selectedHistory.status == 1 {
                            Text("Active")
                                .font(SubTitleCardFontStyle().titleFont)
                                .foregroundColor(Color.green)
                        }
                        else{
                            Text("Cancel")
                                .font(SubTitleCardFontStyle().titleFont)
                                .foregroundColor(Color.red)

                        }
                        Spacer()
                        Text(String(selectedHistory.date))
                            .font(SubTitleCardFontStyle().titleFont)
                            .foregroundColor(Color.gray)
                    }
                }.padding(.horizontal,10)
            }.padding(.vertical,20)
            
        }.padding([.horizontal],30)
            .padding([.vertical],10)
       
    }
}

//struct CardHistoryToken_Previews: PreviewProvider {
//    static var previews: some View {
//        CardHistoryToken()
//    }
//}
