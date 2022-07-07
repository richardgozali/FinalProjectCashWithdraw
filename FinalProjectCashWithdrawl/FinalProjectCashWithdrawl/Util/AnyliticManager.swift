//
//  AnyliticManager.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 29/06/22.
//

import Foundation
import Firebase
struct AnyliticManager {
    func trackEvent (eventName: String, name: String) {
        Analytics.logEvent(eventName, parameters: [
              AnalyticsParameterItemID: "id-\(name)",
              AnalyticsParameterItemName: eventName,
              AnalyticsParameterContentType: "cont"
        ])
    }
    func trackView (id: String, name: String, content: String) {
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [
            AnalyticsParameterItemID: id,
            AnalyticsParameterItemName: name,
            AnalyticsParameterContentType: "cont"
        ])
    }
}
