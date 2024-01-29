//
//  PaymentEntryView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 28.01.24.
//

import Foundation
import SwiftUI

//To log payment entries
struct PaymentEntryView: View {
    @State private var kWhValue: String = ""
    @State private var amountPaid: String = ""
    @State private var selectedMonth: Date = Date()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var paymentDataStore: PaymentDataStore


    var body: some View {
        NavigationView {
            Form {
                TextField("kWh Value", text: $kWhValue)
                    .keyboardType(.decimalPad)
                TextField("Amount Paid", text: $amountPaid)
                    .keyboardType(.decimalPad)
                DatePicker("Month and Year", selection: $selectedMonth, displayedComponents: .date)
                Button("Save Payment") {
                    // Handle saving the payment details
                    presentationMode.wrappedValue.dismiss()
                    savePayment()
                }
            }
            .navigationTitle("New Payment")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    private func savePayment() {
            let newPayment = Payment(kWhValue: Double(kWhValue) ?? 0, amountPaid: Double(amountPaid) ?? 0, date: selectedMonth)
            paymentDataStore.savePayment(newPayment)
            presentationMode.wrappedValue.dismiss()
        }
}
