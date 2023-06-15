//
//  Date.swift
//  Currency
//
//  Created by Başak Ertuğrul on 15.06.2023.
//

import Foundation

extension Date {
    func getPreviousDateString() -> String  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = self
        let previousDate = Calendar.current.date(byAdding: .day, value: -2, to: currentDate)!
        let previousDateString = formatter.string(from: previousDate)
        return previousDateString
    }
    func getTwoDaysBeforeDateString() -> String  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = self
        let twoDaysBeforeDate = Calendar.current.date(byAdding: .day, value: -3, to: currentDate)!
        let twoDaysBeforeDateString = formatter.string(from: twoDaysBeforeDate)
        return twoDaysBeforeDateString
    }
    func getString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: self)
    }
}
