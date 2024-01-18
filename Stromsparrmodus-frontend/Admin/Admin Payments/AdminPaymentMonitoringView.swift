//
//  AdminPaymentMonitoringView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 18.01.24.
//

import Foundation
import SwiftUI

struct AdminPaymentMonitoringView: View {
    let usersPaymentStatus = [("Alice", "Paid"), ("Bob", "Due"), ("Charlie", "Paid")] // Placeholder for actual data

    var body: some View {
        List(usersPaymentStatus, id: \.0) { paymentStatus in
            NavigationLink(destination: AdminUserPaymentDetailView(userName: paymentStatus.0, paymentStatus: paymentStatus.1)) {
                HStack {
                    Text(paymentStatus.0)
                    Spacer()
                    Text(paymentStatus.1)
                }
            }
        }
        .navigationTitle("Payments")
    }
}

struct AdminUserPaymentDetailView: View {
    var userName: String
    var paymentStatus: String

    var body: some View {
        VStack {
            Text("Payment status for \(userName): \(paymentStatus)")
            // More detailed payment information
        }
    }
}
