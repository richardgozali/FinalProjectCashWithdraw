//
//  TransactionPin.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//

import SwiftUI
import Alamofire
struct TransactionPin: View {
    @ObservedObject var viewModel: TransactionPinViewModel
    static var name: String {
        String(describing: self)
    }
    var paramTransactionPin: TransactionPinParam
    private func pinText(text: String) -> some View {
        return Text(text)
            .font(TitleFontStyle().titleFont)
            .frame(width: viewModel.textBoxWidth, height: viewModel.textBoxHeight, alignment: .center)
            .padding(viewModel.paddingOfBox)
            .foregroundColor(Color.blue)
            .background(
                Rectangle().fill(Color.white)
                    .foregroundColor(Color.black)
                    .shadow(color: Color.black, radius: 1)
            )
    }
    var body: some View {
        ZStack {
            ProgressView(R.string.localizable.engLoading())
                .foregroundColor(Color.blue)
                .modifier(HiddenViewModifier(!viewModel.isLoading))
            NavigationCustomBar(
                title: R.string.localizable.engTransactionTitle(),
                isImage: false,
                callBack: {}
            ) {
                HStack(spacing: 20) {
                    VStack(alignment: .center, spacing: 20) {
                        HStack {
                            VStack {
                                ZStack {
                                    ErrorMessage(
                                        selectedShow: $viewModel.selectedShow,
                                        title: R.string.localizable.engErrorMessage()
                                    )
                                    VStack {
                                        Text(
                                            R.string.localizable.engInsertpin())
                                        .font(SubTitleFontStyle().titleFont).foregroundColor(Color.gray)
                                    }.modifier(HiddenViewModifier(viewModel.selectedShow))
                                }
                            }
                        }.frame(height: 40)
                        Image(systemName: "lock.fill").foregroundColor(Color.black)
                        ZStack {
                            HStack(spacing: 10) {
                                pinText(text: viewModel.getDataPin(index: 0))
                                pinText(text: viewModel.getDataPin(index: 1))
                                pinText(text: viewModel.getDataPin(index: 2))
                                pinText(text: viewModel.getDataPin(index: 3))
                                pinText(text: viewModel.getDataPin(index: 4))
                                pinText(text: viewModel.getDataPin(index: 5))
                            }.padding([.vertical], 20)
                            TextField("", text: $viewModel.isPin)
                                .disabled(false)
                                .textContentType(.oneTimeCode)
                                .foregroundColor(.clear)
                                .accentColor(.clear)
                                .background(Color.clear)
                                .keyboardType(.numberPad)
                                .onChange(of: viewModel.isPin, perform: { _ in
                                    if viewModel.isPin.count>6 {
                                        viewModel.limitText()
                                    }
                                    print(viewModel.isPin)
                                })
                        }
                        Spacer()
                        ButtonView(
                            buttonStyle: PrimaryButtonStyle(),
                            label: R.string.localizable.engContinue(), action: {
                                viewModel.pinChecking()
                            }).padding(.horizontal, 20)
                    }
                }.modifier(HiddenViewModifier(viewModel.isLoading))
                    .padding(.vertical, 20)
            }
        }
    }
}
