//
//  TransactionPinUseCase.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 06/07/22.
//

import Foundation
import Alamofire

class TransactionPinUseCase {
    private(set) var repository = Repository()
    var input = Input()
    var callback = Callback()
    func fetchData() {
        Alamofire.request(baseUrlApiAri + "/Account").responseObject { [self] (response: DataResponse<ResponseFund>) in
            repository.listFunds = response.value?.fund ?? []
            if repository.listFunds == [] {
                self.callback.onFetchFailed()
                return
            }
            let parameters: Parameters = [
                "amount": input.paramTransaction.amount,
                "date": "20 Jun",
                "phonenumber": input.paramTransaction.phoneNumber,
                "pin": input.paramTransaction.pin,
                "time": "13:00"
            ]
            Alamofire.request(
                baseUrlApiAri + "/History",
                method: .post,
                parameters: parameters,
                encoding: URLEncoding(destination: .queryString)
            ).responseObject {(_: DataResponse<ResponeHistory>) in
                self.callback.onFetchSuccess()
                return
            }
        }
    }
    func loadData() {
        guard let data = JsonReader.loadDataFrom(filename: "Fund") else {
            self.callback.onFetchFailed()
            return
        }
        do {
            repository.listFunds = try JSONDecoder().decode([Fund].self, from: data)
            self.callback.onFetchSuccess()
            return
        } catch {
            self.callback.onFetchFailed()
            return
        }
    }
    func pinCheck(isPin: String) {
        if String(input.paramTransaction.selectedFund.pin) == isPin {
            self.callback.onPinSuccess()
            return
        } else {
            self.callback.onPinError()
            return
        }
    }
}

extension TransactionPinUseCase {
    class Input {
        var paramTransaction = TransactionPinParam()
    }
    class Repository {
        var listFunds = [Fund]()
    }
    class Callback {
        var onFetchSuccess: () -> Void = { return }
        var onFetchFailed: () -> Void = { return }
        var onPinSuccess: () -> Void = {return}
        var onPinError: () -> Void = {return}

    }
}
