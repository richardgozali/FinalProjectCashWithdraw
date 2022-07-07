//
//  CashWithdrawCoordinator.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 06/07/22.
//

import Foundation
import SwiftUI
struct CashWithdrawCoordinator: View {
    static var name: String {
        String(describing: self)
    }
    @State private var destinationCoordinatorName: String?
    @State private var viewModel = CashWithdrawViewModel()
    private(set) var useCase = CashWithdrawUseCase()
    @Binding var selectedNavigation: String?
    @Binding var fund: Fund
    @Binding var listFund: [Fund]
    var body: some View {
        NavigationLink(
            destination: CashWithdraw(
                viewModel: self.createViewModel()
            ),
            tag: CashWithdrawCoordinator.name,
            selection: $selectedNavigation
        ) { EmptyView() }
    }
    private func createViewModel() -> CashWithdrawViewModel {
        if selectedNavigation != CashWithdrawCoordinator.name {
            return viewModel
        }
        viewModel.onCreateNavigationLinks = createNavigationLinks
        viewModel.setUseCase(createUseCase())
        viewModel.fund = fund
        return viewModel

    }
    private func createUseCase() -> CashWithdrawUseCase {
        useCase.callback.onValidatePinSuccess = startTransactionPinCoordinator
        useCase.input.selectedFund = fund
        return useCase
    }

    private func startTransactionPinCoordinator() {
        destinationCoordinatorName = TransactionPinCoordinator.name
    }
    private func createNavigationLinks() -> AnyView {
        AnyView(
            Group {
                TransactionPinCoordinator(
                    selectedCoordinatorName: $destinationCoordinatorName,
                    sourceNavigation: $selectedNavigation,
                    listFunds: $listFund,
                    paramTransactionPin: $viewModel.paramTransactionPin
                )
                NavigationLink(
                    destination: HistoryToken(
                        sourceNavigation: $selectedNavigation
                    ),
                    tag: "History",
                    selection: $viewModel.navigationSelection
                ) {EmptyView()}
            }
        )
    }
}
