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
    private let fileName = "payments.json"
    
    init() {
        loadPayments()
    }
    
    func getLatestPayment() -> Payment? {
        return payments.sorted { $0.date > $1.date }.first
    }
    
    func loadPayments() {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        if let data = try? Data(contentsOf: fileURL) {
            let decoder = JSONDecoder()
            if let loadedPayments = try? decoder.decode([Payment].self, from: data) {
                self.payments = loadedPayments
            }
        }
    }
    
    func savePayment(_ payment: Payment) {
        payments.append(payment)
        savePaymentsToFile()
    }
    
    private func savePaymentsToFile() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(payments) {
            let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
            try? encoded.write(to: fileURL)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
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
    
    func deletePayment(_ payment: Payment) {
        if let index = payments.firstIndex(where: { $0.id == payment.id }) {
            payments.remove(at: index)
            savePaymentsToFile()
        }
    }
}

extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        let components = dateComponents([.year, .month], from: date)
        return self.date(from: components)!
    }
}
