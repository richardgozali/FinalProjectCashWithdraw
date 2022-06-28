//
//  JsonReader.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 24/06/22.
//

import Foundation

struct JsonReader {
    static func loadDataFrom(filename: String) -> Data? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json")else {
            return nil
        }
        do {
            let jsonData = try Data(
                contentsOf: URL(fileURLWithPath: path),
                options: .mappedIfSafe
            )
            return jsonData
        } catch {
            return nil
        }
    }
}
