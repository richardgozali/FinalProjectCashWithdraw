//
//  ButtonStyle.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import Foundation
import SwiftUI

protocol ButtonStyleProtocol {
    var titleFontColor : Font {get}
    var backgroundFontColor : Color {get}
}

struct PrimaryButtonStyle : ButtonStyleProtocol {
    var backgroundFontColor: Color{Color.white}
    var titleFontColor: Font {Font.system(size: 16,weight : .bold, design: .serif)}
}
