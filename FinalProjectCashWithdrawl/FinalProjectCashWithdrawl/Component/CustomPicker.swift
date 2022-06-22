//
//  CustomPicker.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import Foundation
import SwiftUI

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
struct CustomPicker :View{
    var data : [Int] = [100000 , 300000 , 400000 , 500000, 600000 ,700000 , 800000,900000,1000000]
    @State var selectedAmount: Int = 0
    
    var body: some View {
        
        Menu {
            Picker(selection: $selectedAmount, label: EmptyView()) {
                ForEach(data,id: \.self) { item in
                    if item != 0 {
                        Text("Rp " + String(item.withCommas())).font(.system(size: 14,weight : .light, design: .serif))
                    }
                    
                }
            }
        } label: {
            customLabel
        }
    }
    
    var customLabel: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("Amount").font(.system(size: 16,weight : .bold, design: .serif)).foregroundColor(Color.black)
            HStack {
                if selectedAmount != 0 {
                    Text("Rp " + String(selectedAmount.withCommas())).font(.system(size: 14,weight : .light, design: .serif))
                }
                
                Spacer()
                Text("⌵")
                    .offset(y: -4)
            }.foregroundColor(Color.black)
            Divider().background(Color.black)
        }
    }
    
}
