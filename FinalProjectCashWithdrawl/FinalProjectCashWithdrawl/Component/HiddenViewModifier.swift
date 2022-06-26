//
//  Modifier.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

struct HiddenViewModifier: ViewModifier {
    private let isHidden : Bool
    init(_ isHidden : Bool){
        self.isHidden = isHidden
    }
    func body(content: Content) -> some View {
        if self.isHidden {
            EmptyView()
        }
        else{
            content
        }
    }
}
