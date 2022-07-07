//
//  ViewModelCashWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 30/06/22.
//

import Foundation
import Alamofire
import SwiftUI
class CashWithdrawViewModel: ObservableObject {
    @Published var navigationSelection: String?
    @Published var isNavigationBarHidden: Bool = false
    @Published var paramTransactionPin = TransactionPinParam()
    @Published var selectedShow = false
    @Published var amounts = [Amount]()
    @Published var phoneNumber: String = ""
    @Published var pin: String = ""
    @Published var selectedAmount: Int = 0
    @Published var isErrorPhone: Bool = true
    @Published var isErrorPin: Bool = true
    @Published var isErrorAmount: Bool = true
    @Published var showingSheet = false
    @Binding var fund: Fund
    @Binding var sourceNavigation: String?
    @Binding var listFunds: [Fund]
    private(set) var useCase = CashWithdrawUseCase()
    var onCreateNavigationLinks: () -> AnyView = { AnyView( EmptyView() ) }
    func fetchData() {
        useCase.fetchData()
        fund = useCase.input.selectedFund
    }
    func onMoveHistoryPage() {
        navigationSelection = "History"
    }

    func onCheck() {
        if phoneNumber ==  "" {
            isErrorPhone = false
        } else {
            isErrorPhone = true
            print(isErrorPhone)
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
        errorChecking()
    }
    func isFetchSuccess() {
        self.amounts = useCase.repository.amounts
        self.fund = useCase.input.selectedFund
        print("asdasd")
    }
    func errorHandler() {
        print("asdasd")
    }
    private func errorChecking () {
        if isErrorPhone && isErrorPin && isErrorAmount {
            paramTransactionPin = TransactionPinParam(
                phoneNumber: phoneNumber,
                pin: pin,
                amount: selectedAmount,
                selectedFund: fund
            )
            useCase.validatePin(selectedAmount: selectedAmount)
        }
    }
//    private func isPinSuccess() {
//        print("masuk")
//    }
    private func isPinError() {
        selectedShow = true
    }
    func setUseCase(_ useCase: CashWithdrawUseCase) {
        useCase.callback.onFetchSuccess = isFetchSuccess
        useCase.callback.onFetchFailed = errorHandler
        useCase.callback.onValidatePinError = isPinError
        self.useCase = useCase
    }
    init(selectedFund: Binding<Fund> = .constant(Fund()),
         sourceNavigation: Binding<String?> = .constant(nil),
         listFunds: Binding<[Fund]> = .constant([Fund]())
    ) {
        self._fund = selectedFund
        self._listFunds = listFunds
        self._sourceNavigation = sourceNavigation
    }

}
