//
//  Date+Ex.swift
//  Profile App
//
//  Created by Настя Сойко on 4.03.21.
//

import Foundation

extension Date {
    var toInt: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter.string(from: self)
    }
}
