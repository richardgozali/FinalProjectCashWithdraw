//
//  CashWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct CashWithdraw: View {
    @State var phoneNumber: String = ""
    @State var pin: String = ""
    @State var selectedAmount: Int = 0
    @State private var isErrorPhone: Bool = true
    @State private var isErrorPin: Bool = true
    @State private var isErrorAmount: Bool = true
    @State private var showingSheet = false
    @Binding var fund: Fund
    @Binding var listFund: [Fund]
    @Binding var sourceNavigation: String?
    @State var navigationSelection: String?
    @State var isNavigationBarHidden: Bool = false
    @State private var selectedShow = false
    private func renderLink() -> some View {
        Group {
            NavigationLink(
                destination: TransactionPin(
                    fund: $fund,
                    sourceNavigation: $sourceNavigation,
                    listFunds: $listFund
                ),
                tag: "TransactionPin",
                selection: $navigationSelection
            ) {EmptyView()}
            NavigationLink(
                destination: HistoryToken(
                    sourceNavigation: $sourceNavigation
                ),
                tag: "History",
                selection: $navigationSelection
            ) {EmptyView()}
        }
    }
    private func onMovePage() {
        navigationSelection = "TransactionPin"
    }
    private func onMoveHistoryPage() {
        navigationSelection = "History"
    }
    private func onCheck() {
        if phoneNumber ==  "" {
            isErrorPhone = false
        } else {
            isErrorPhone = true
        }
        if pin ==  "" || pin.count < 6 {
            isErrorPin = false
        } else {
            isErrorPin = true
        }
        if selectedAmount ==  0 {
            isErrorAmount = false
        } else {
            isErrorAmount = true
        }
        if isErrorPhone || isErrorPin || isErrorAmount {
            if fund.saldo > selectedAmount {
                onMovePage()
            } else {
                print("Saldo Tidak Cukup")
                self.selectedShow = true
            }
        }
    }

    var body: some View {
        renderLink()
        NavigationCustomBar(
            title: R.string.localizable.engCashwithdrawTitle(),
            isImage: true,
            navigationSelection: $navigationSelection
        ) {
            VStack(alignment: .leading, spacing: 10) {
                FormWithdraw {
                    VStack(alignment: .leading, spacing: 20) {
                        CustomTextField(
                            value: $phoneNumber,
                            isError: isErrorPhone,
                            title: R.string.localizable.engPhoneTitle(),
                            placeHolder: R.string.localizable.engPhonePlaceholder(),
                            errorMassage: R.string.localizable.engPhoneError()
                        )
                        Button(action: {
                            self.showingSheet.toggle()
                        }, label: {
                            SheetAmount(
                                selectedAmount: $selectedAmount,
                                errorMsg: R.string.localizable.engAmountError(),
                                isError: isErrorAmount
                            )
                        }).sheet(isPresented: $showingSheet) {
                            SheetView(selectedAmount: $selectedAmount)
                        }
                        CustomTextField(
                            value: $pin,
                            isError: isErrorPin,
                            title: R.string.localizable.engPinTitle(),
                            placeHolder: R.string.localizable.engPinPlaceholder(),
                            errorMassage: R.string.localizable.engPinError()
                        )
                    }.padding(.all, 30)
                }
                Spacer()
                ButtonView(
                    buttonStyle: PrimaryButtonStyle(),
                    label: "Continue", action: {
                        onCheck()
                    }).frame(alignment: .bottom)

            }.padding([.all], 20)
                .bottomSheet(isPresented: $selectedShow) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(R.string.localizable.engBalanceTitle()).font(TitleFontStyle().titleFont)
                        Text(R.string.localizable.engBalanceSubtitle())
                        ButtonCancel(
                            buttonStyle: PrimaryButtonStyle(),
                            label: "Ok", action: {
                                withAnimation(Animation.easeInOut) {
                                    self.selectedShow = false
                                }
                            }
                        )
                    }
                }

        }

    }
}
