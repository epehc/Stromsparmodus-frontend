//
//  PaymentSummaryView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct PaymentSummaryView: View {
    @ObservedObject var paymentDataStore: PaymentDataStore
    @State private var latestPayment: Payment?
    var body: some View {
        HStack {
            Image(systemName: "creditcard.fill")
                .foregroundColor(.green)
                .imageScale(.large)
                .frame(width: 50)

            VStack(alignment: .leading) {
                Text("Payments")
                    .font(.headline)
                if let latestPayment = latestPayment {
                                Text("Latest Payment: \(latestPayment.date, formatter: dateFormatter)")
                                .font(.subheadline)
                            } else {
                                Text("No recent payments")
                                .font(.subheadline)
                            }
                    
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .onAppear{
            latestPayment = paymentDataStore.getLatestPayment()
        }
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

