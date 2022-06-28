//
//  ExtensionView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 22/06/22.
//

import SwiftUI

extension View {
    func setHidden(_ hidden: Bool) -> some View {
        modifier( HiddenViewModifier( hidden ))
    }
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
    func bottomSheet<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self
            .overlay(
                Group {
                    if isPresented.wrappedValue {
                        BottomSheet(
                            isPresented: isPresented,
                            content: content
                        )
                    }
                }
            )
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
extension Binding {
    func didSet(
        _ didSet: @escaping ((newValue: Value, oldValue: Value)) -> Void
    ) -> Binding<Value> {
        return .init(get: { self.wrappedValue }, set: { newValue in
            let oldValue = self.wrappedValue
            self.wrappedValue = newValue
            didSet((newValue, oldValue))
        })
    }
    func willSet(
        _ willSet: @escaping ((newValue: Value, oldValue: Value)) -> Void
    ) -> Binding<Value> {
        return .init(get: { self.wrappedValue }, set: { newValue in
            willSet((newValue, self.wrappedValue))
            self.wrappedValue = newValue
        })
    }
}
