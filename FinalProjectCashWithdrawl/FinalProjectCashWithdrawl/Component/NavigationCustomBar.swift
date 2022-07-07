//
//  NavigationBar.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//

import SwiftUI

struct NavigationCustomBar <Child: View> :  View {
    var title: String
    var isImage: Bool? = false
    var callBack: () -> Void?
    let childView: Child
    init(title: String,
         isImage: Bool?,
         callBack: @escaping () -> Void?,
         _ childView: () -> (Child)
    ) {
        self.childView = childView()
        self.title = title
        self.isImage = isImage
        self.callBack = callBack
    }
    private func onMovePage() {
    }
    var body: some View {
        VStack {
            childView
        }
        .navigationBarHidden(false)
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    if isImage == true {
                        Spacer()
                        Text(title).font(TitleFontStyle().titleFont)
                        Spacer()
                        Image(systemName: "clock.arrow.circlepath")
                            .onTapGesture {
                                callBack()
                            }
                    } else {
                        Text(title).font(TitleFontStyle().titleFont)
                    }
                }
            }
        }
    }
}
