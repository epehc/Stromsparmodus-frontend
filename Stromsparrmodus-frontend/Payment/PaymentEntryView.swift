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
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var paymentDataStore: PaymentDataStore
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("kWh Value", text: $kWhValue)
                    .keyboardType(.decimalPad)
                TextField("Amount Paid", text: $amountPaid)
                    .keyboardType(.decimalPad)
                DatePicker("Month and Year", selection: $selectedMonth, in: ...Date(), displayedComponents: .date)
                Button("Save Payment") {
                    // Handle saving the payment details
                    self.attemptToAddPayment()
                    
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                        self.showAlert = false
                        presentationMode.wrappedValue.dismiss()
                    }))
                }
               
            }
            .navigationTitle("New Payment")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func attemptToAddPayment() {
        let newPayment = Payment(kWhValue: Double(kWhValue) ?? 0, amountPaid: Double(amountPaid) ?? 0, date: selectedMonth)
        
        guard newPayment.amountPaid > 0 && newPayment.kWhValue > 0 else {
            alertTitle = "Error"
            alertMessage = "Please enter valid values"
            showAlert = true
            return
        }
        let success = paymentDataStore.addPayment(newPayment)
        if success {
            // Payment added successfully
            alertTitle = "Success"
            alertMessage = "Payment added successfully."
        } else {
            // Payment for this month already exists
            alertTitle = "Error"
            alertMessage = "A payment for this month already exists."
            
        }
        showAlert = true
    }
    
   
}
