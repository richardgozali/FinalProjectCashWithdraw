//
//  CashWithdrawUseCase.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 06/07/22.
//

import Foundation
import Alamofire
class CashWithdrawUseCase {
    private(set) var repository = Repository()
    var input = Input()
    var output = Output()
    var callback = CallBack()

    private func loadData() {
        guard let data = JsonReader.loadDataFrom(filename: "Amount") else {
            return
        }
        do {
            self.repository.amounts = try JSONDecoder().decode([Amount].self, from: data)

        } catch {
            print(error)
            return
        }
    }
    func fetchData() {
        Alamofire.request(baseUrlApiAri + "/Amount").responseObject { (response: DataResponse<ResponseAmount>) in
            self.repository.amounts = response.value?.amount ?? []
            if self.repository.amounts == [] {
                self.callback.onFetchFailed()
                return
            }
            self.callback.onFetchSuccess()
            return
        }
    }
    func validatePin(selectedAmount: Int) {
        if input.selectedFund.saldo > selectedAmount {
            self.callback.onValidatePinSuccess()
            return
        } else {
            print("Saldo Tidak Cukup")
            self.callback.onValidatePinError()
            return
        }
    }
}
extension CashWithdrawUseCase {
    class Input {
        var selectedFund = Fund()
    }
    class Repository {
        var amounts = [Amount]()
    }
    class Output {
        var paramTransactionPin = TransactionPinParam()
    }
    class CallBack {
        var onFetchSuccess: () -> Void = { return }
        var onFetchFailed: () -> Void = { return }
        var onValidatePinSuccess: () -> Void = { return }
        var onValidatePinError: () -> Void = { return }
    }
}
