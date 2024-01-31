//
//  PaymentDataStore.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 28.01.24.
//

import Foundation
import Combine

//Some helpful functions to call on regarding payments
class PaymentDataStore: ObservableObject {
    @Published var payments: [Payment] = []
    
    private let paymentsKey = "paymentsData"
        
    init() {
        loadPayments()
    }
    
    func getLatestPayment() -> Payment? {
        return payments.sorted { $0.date > $1.date }.first
    }
    
    func loadPayments() {
        if let data = UserDefaults.standard.data(forKey: paymentsKey) {
            let decoder = JSONDecoder()
            if let loadedPayments = try? decoder.decode([Payment].self, from: data) {
                self.payments = loadedPayments
            }
        }
    }
    
    func savePayments() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(payments) {
            UserDefaults.standard.set(encoded, forKey: paymentsKey)
        }
    }
    
    func addPayment(_ newPayment: Payment) -> Bool {
            // Check if the payment amount is zero or negative
            guard newPayment.amountPaid > 0 else {
                return false
            }

            // Check if the date is in the future
            guard newPayment.date <= Date() else {
                return false
            }

            let calendar = Calendar.current
            let newPaymentMonth = calendar.startOfMonth(for: newPayment.date)

            // Check if a payment for this month already exists
            let existingPaymentForMonth = payments.contains {
                calendar.isDate($0.date, equalTo: newPaymentMonth, toGranularity: .month)
            }

            if existingPaymentForMonth {
                // A payment for this month already exists
                return false
            } else {
                // Add new payment
                payments.append(newPayment)
                savePayments()
                return true
            }
        }
    
    func deletePayment(_ payment: Payment) {
        if let index = payments.firstIndex(where: { $0.id == payment.id }) {
            payments.remove(at: index)
            savePayments()
        }
    }
    
    func calculateAveragePaymentForPastMonths() -> Double? {
        let calendar = Calendar.current
        let startOfCurrentMonth = calendar.startOfMonth(for: Date())
        
        let pastPayments = payments.filter { $0.date < startOfCurrentMonth }
        
        guard !pastPayments.isEmpty else {
            return nil
        }
        
        let total = pastPayments.reduce(0) { $0 + $1.amountPaid }
        return total / Double(pastPayments.count)
    }
    
    func calculateCurrentMonthPayment() -> Double? {
        let currentMonthPayments = payments.filter {
            Calendar.current.isDate($0.date, equalTo: Date(), toGranularity: .month)
        }
        
        guard !currentMonthPayments.isEmpty else {
            return nil
        }
        
        return currentMonthPayments.reduce(0) { $0 + $1.amountPaid }
    }
    
    
}

extension Calendar {
    func startOfMonth(for date: Date) -> Date {
           let components = dateComponents([.year, .month], from: date)
           return self.date(from: components)!
       }
}
