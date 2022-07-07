//
//  ViewModelSourceFund.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 30/06/22.
//

import Foundation
import Alamofire
import Firebase
import FirebaseAnalytics
import AlamofireObjectMapper
class ViewModelSourceFund: ObservableObject {
     @Published var sourceNavigation: String?
     @Published var funds = [Fund]()
     @Published var selectedFund: Fund = Fund()
     @Published var isActiove: Int?
     @Published var isLoading: Bool = true
     private func fetchData() {
         Alamofire.request(
            baseUrlApiAri + "/Account"
         ).responseObject { (response: DataResponse<ResponseFund>) in
             self.funds = response.value?.fund ?? []
             self.isLoading = false

         }
    }
    private func loadData() {
        guard let data = JsonReader.loadDataFrom(filename: "Fund") else {
            return
        }
        do {
            self.funds = try JSONDecoder().decode([Fund].self, from: data)
            print(funds[0])
        } catch {
            print(error)
            return
        }
    }
    init() {
        fetchData()
        print(baseUrlApiAri)
    }
}
