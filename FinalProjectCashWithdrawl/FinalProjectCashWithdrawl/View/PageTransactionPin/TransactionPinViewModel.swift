//
//  ViewModelTransactionPin.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 04/07/22.
//

import Foundation
import SwiftUI
import Alamofire
class TransactionPinViewModel: ObservableObject {
    @Published var isPin: String = ""
    @Published var disableTextField: Bool  = false
    @Published var isFocused = true
    @Published var isLoading = false
    @Published var selectedShow = false
    @Binding var sourceNavigation: String?
    @Binding var listFunds: [Fund]
    private (set) var useCase = TransactionPinUseCase()
    var paramTransactionPin: TransactionPinParam = TransactionPinParam()
    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 10
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    var anayticManager = AnyliticManager()
    init(
        sourceNavigation: Binding<String?> = .constant(nil),
        listFunds: Binding<[Fund]> = .constant([])
    ) {
        self._sourceNavigation = sourceNavigation
        self._listFunds = listFunds
    }
    func getDataPin(index: Int) -> String {
        if isPin.count > index {
            if isPin.count > index {
                return "*"
            }
            return ""
        }
        return ""
    }
    func limitText(_ upper: Int = 6) {
        if isPin.count > upper {
            isPin = String(isPin.prefix(upper))
        }
        print(isPin)
    }
    private func fetchData() {
        useCase.fetchData()
    }
    private func successChecking() {
        isLoading = false
    }
    func pinChecking() {
        isLoading = true
        anayticManager.trackEvent(
            eventName: R.string.localizable.engTransactionTitle(),
            name:
                String(self.paramTransactionPin.selectedFund.nomorRekening)
               + " : " +
                String(paramTransactionPin.selectedFund.saldo)
        )
        useCase.pinCheck(isPin: isPin)
    }
    func errorHandler() {
        loadData()
        self.sourceNavigation = nil
    }
    private func errorHandlerPin() {
        isLoading  = false
        selectedShow = true
    }

    func setUseCase(_ useCase: TransactionPinUseCase) {
        useCase.callback.onFetchSuccess = successChecking
        useCase.callback.onPinError = errorHandlerPin
        useCase.callback.onFetchFailed = errorHandler
        self.useCase = useCase
    }
    func loadData() {
        isLoading = true
    }
}
