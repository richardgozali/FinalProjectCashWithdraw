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
    @Binding var navigationSelection: String?
    let childView: Child
    init(title: String,
         isImage: Bool?,
         navigationSelection: Binding<String?> = .constant(nil),
         _ childView: () -> (Child)
    ) {
        self.childView = childView()
        self.title = title
        self.isImage = isImage
        self._navigationSelection = navigationSelection
    }
    private func onMovePage() {
    }
    var body: some View {
        ZStack {
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
                            navigationSelection = "History"
                        }
                    } else {
                        Text(title).font(TitleFontStyle().titleFont)
                    }
                }
            }
        }
    }
}
