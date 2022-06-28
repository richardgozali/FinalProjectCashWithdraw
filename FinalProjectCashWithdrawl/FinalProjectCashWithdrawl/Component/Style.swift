//
//  ButtonStyle.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import Foundation
import SwiftUI

protocol ButtonStyleProtocol {
    var titleFontColor: Font {get}
    var backgroundFontColor: Color {get}
}

struct PrimaryButtonStyle: ButtonStyleProtocol {
    var backgroundFontColor: Color {Color.white}
    var titleFontColor: Font {Font.system(size: 16, weight: .bold, design: .serif)}
}

protocol TextFontProctocol {
    var titleFont: Font {get}
    var fontColor: Color {get}
}

struct TitleFontStyle: TextFontProctocol {
    var titleFont: Font {
        {Font.system(size: 22, weight: .bold, design: .serif)}()
    }
    var fontColor: Color {Color.black}
}
struct TitleCardFontStyle: TextFontProctocol {
    var titleFont: Font {Font.system(size: 18, weight: .bold, design: .serif)}
    var fontColor: Color {Color.black}

}
struct SubTitleCardFontStyle: TextFontProctocol {
    var titleFont: Font {Font.system(size: 14, weight: .regular, design: .serif)}
    var fontColor: Color {Color.black}

}
struct SubTitleFontStyle: TextFontProctocol {
    var titleFont: Font {Font.system(size: 16, weight: .light, design: .serif)}
    var fontColor: Color {Color.black}

}

struct ErrorMessageStyle: TextFontProctocol {
    var titleFont: Font {Font.system(size: 16, weight: .bold, design: .serif)}
    var fontColor: Color {Color.black}
}
