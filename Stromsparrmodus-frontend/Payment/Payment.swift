//
//  Payment.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 28.01.24.
//

import Foundation

struct Payment: Codable, Identifiable {
    var id = UUID()
    var kWhValue: Double
    var amountPaid: Double
    var date: Date
}


