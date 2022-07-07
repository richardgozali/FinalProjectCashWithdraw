//
//  CashWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI
import Alamofire
import AlamofireObjectMapper
struct CashWithdraw: View {
    @ObservedObject var viewModel: CashWithdrawViewModel
    static var name: String {
        String(describing: self)
    }
    var body: some View {
        NavigationCustomBar(
            title: R.string.localizable.engCashwithdrawTitle(),
            isImage: true,
            callBack: viewModel.onMoveHistoryPage
        ) {
            VStack(alignment: .leading, spacing: 10) {
                viewModel.onCreateNavigationLinks()
                FormWithdraw {
                    VStack(alignment: .leading, spacing: 20) {
                        CustomTextField(
                            value: $viewModel.phoneNumber,
                            isError: viewModel.isErrorPhone,
                            title: R.string.localizable.engPhoneTitle(),
                            placeHolder: R.string.localizable.engPhonePlaceholder(),
                            errorMassage: R.string.localizable.engPhoneError(),
                            limitText: 15
                        )
                        Button(action: {
                            viewModel.showingSheet.toggle()
                        }, label: {
                            SheetAmount(
                                selectedAmount: $viewModel.selectedAmount,
                                errorMsg: R.string.localizable.engAmountError(),
                                isError: viewModel.isErrorAmount
                            )
                        }).sheet(isPresented: $viewModel.showingSheet) {
                            SheetView(
                                selectedAmount: $viewModel.selectedAmount,
                                listAmount: $viewModel.amounts
                            )
                        }
                        CustomTextField(
                            value: $viewModel.pin,
                            isError: viewModel.isErrorPin,
                            title: R.string.localizable.engPinTitle(),
                            placeHolder: R.string.localizable.engPinPlaceholder(),
                            errorMassage: R.string.localizable.engPinError(),
                            limitText: 6
                        )
                    }.padding(.all, 30)
                }.frame(maxHeight: .infinity, alignment: .top)
                ButtonView(
                    buttonStyle: PrimaryButtonStyle(),
                    label: "Continue", action: {
                        viewModel.onCheck()
                    }).frame(alignment: .bottom)
            }.padding([.all], 20)
                .bottomSheet(isPresented: $viewModel.selectedShow) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(R.string.localizable.engBalanceTitle()).font(TitleFontStyle().titleFont)
                        Text(R.string.localizable.engBalanceSubtitle())
                        ButtonCancel(
                            buttonStyle: PrimaryButtonStyle(),
                            label: "Ok", action: {
                                withAnimation(Animation.easeInOut) {
                                    viewModel.selectedShow = false
                                }
                            }
                        )
                    }
                }
        }.onAppear {
            viewModel.fetchData()
        }
    }
}
