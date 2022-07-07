//
//  ViewModelHistoryToken.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 30/06/22.
//
import Foundation
import Alamofire
class ViewModelHistoryToken: ObservableObject {
    @Published var selectedHistoryToken: History = History()
    @Published var sourceHistoryNavigation: String?
    @Published var historytokens = [History]()
    @Published var isLoading = false
    var anayticManager = AnyliticManager()
    private func fetchData() {
        Alamofire.request(baseUrlApiAri + "/History").responseObject {[self] (response: DataResponse<ResponeHistory>)
            in
            self.historytokens = response.value?.history ?? []
            isLoading = true
            if historytokens == [] {
                loadData()
            }
            return
        }
    }
    private func loadData() {
        guard let data = JsonReader.loadDataFrom(filename: "History") else {
            return
        }
        do {
            self.historytokens = try JSONDecoder().decode([History].self, from: data)
        } catch {
            print(error)
            return
        }
    }
    func onTapSelectedCard(selectedHistoryToken: History) {
        anayticManager.trackEvent(
            eventName: "VisitHistoryToken",
            name: String(selectedHistoryToken.idHistory)
        )
        onMovePageDetailHistory(selectedHistoryToken: selectedHistoryToken)
    }
    private func onMovePageDetailHistory(selectedHistoryToken: History) {
        self.sourceHistoryNavigation = "DetailHistoryToken"
        self.selectedHistoryToken = selectedHistoryToken
    }
    init() {
        fetchData()
    }
}
