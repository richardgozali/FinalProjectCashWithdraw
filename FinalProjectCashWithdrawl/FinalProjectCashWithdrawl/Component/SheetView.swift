//
//  SheetView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedAmount: Int
    @State private var amounts = [Amount]()
    
    private func loadData(){
        
        guard let data = JsonReader.loadDataFrom(filename: "Amount") else{
            return
        }
        print("masuk")
        do{
            self.amounts = try JSONDecoder().decode([Amount].self, from: data)
            
            print(amounts[0])
        }catch{
            print(error)
            return
        }
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            Text("Choose Amount").font(TitleFontStyle().titleFont)
            LazyVStack(spacing : 20){
                ForEach(amounts, id: \.id) { amount in
                    if  amount.amount != 0 {
                        VStack(alignment: .leading, spacing: 10){
                            HStack{
                                Text("IDR " + String(amount.amount.withCommas()))
                                    .font(SubTitleFontStyle().titleFont)
                            }
                            Divider()
                        }.onTapGesture {
                            selectedAmount = amount.amount
                            print(String(selectedAmount))
                            dismiss()
                        }

                    }
                    
                }
               
            }
            Spacer()
        }.padding([.all],20)
            .onAppear(){
                loadData()
            }
    }
}
