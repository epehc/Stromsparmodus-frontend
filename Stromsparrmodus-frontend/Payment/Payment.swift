//
//  Payment.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 28.01.24.
//

import Foundation

//The structure of a Payment

struct Payment: Codable, Identifiable {
    var id = UUID()
    var kWhValue: Double
    var amountPaid: Double
    var date: Date
}


