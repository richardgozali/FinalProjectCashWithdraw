//
//  TransactionPinCoordinator.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 06/07/22.
//

import Foundation
import SwiftUI

struct TransactionPinCoordinator: View {
    static var name: String {
        String(describing: self)
    }
    @State private var viewModel = TransactionPinViewModel()
    @State private(set) var useCase = TransactionPinUseCase()
    @Binding var selectedCoordinatorName: String?
    @Binding var sourceNavigation: String?
    @Binding var listFunds: [Fund]
    @Binding var paramTransactionPin: TransactionPinParam
    var body: some View {
        NavigationLink(
            destination: TransactionPin(
                viewModel: createViewModel(),
                paramTransactionPin: paramTransactionPin
            ),
            tag: TransactionPinCoordinator.name,
            selection: $selectedCoordinatorName
        ) { EmptyView() }
    }

    private func createViewModel() -> TransactionPinViewModel {
        if selectedCoordinatorName != TransactionPinCoordinator.name {
            return viewModel
        }
        viewModel.setUseCase(createUseCase())
        viewModel.listFunds = listFunds
        viewModel.sourceNavigation = sourceNavigation
        return viewModel
    }
    private func backToHome() {
        selectedCoordinatorName = nil
        sourceNavigation = nil
    }
    private func createUseCase() -> TransactionPinUseCase {
//        useCase.callback.onFetchSuccess = backToHome
        useCase.callback.onPinSuccess = backToHome
        useCase.input.paramTransaction = paramTransactionPin
        return useCase
    }

}
