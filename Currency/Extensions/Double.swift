//
//  Double.swift
//  Currency
//
//  Created by Başak Ertuğrul on 9.06.2023.
//

import Foundation

extension Double {
    var liraString: String {
        return String(format: "₺%.2f", self)
    }
    var string: String {
        return  String(format: "%.2f", self)
    }
}
