//
//  FormWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct FormWithdraw<child :View> : View {
    let childView : child
    init(_ childView: () ->(child)){
        self.childView = childView()
        
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 20)
            childView
        }.padding([.horizontal] , 20)
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity,  maxHeight: 350, alignment: .top)
    }
}


