//
//  Fund_Repository.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 21/06/22.
//

import Foundation
class apiCall {
    func getUserComments(completion:@escaping ([Fund]) -> ()) {
        guard let url = URL(string: "https://62b16e37196a9e9870353b48.mockapi.io/FinalProject/Account") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let funds = try! JSONDecoder().decode([Fund].self, from: data!)
            print(funds)
            
            DispatchQueue.main.async {
                completion(funds)
            }
        }
        .resume()
    }
}
