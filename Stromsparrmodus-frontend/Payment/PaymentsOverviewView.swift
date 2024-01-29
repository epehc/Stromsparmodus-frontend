//
//  PaymentsOverviewView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 29.01.24.
//

import Foundation
import SwiftUI

struct PaymentsOverviewView: View {
    @ObservedObject var paymentDataStore: PaymentDataStore
    var averageLastThreeMonthsPayment: Double?
    var currentMonthPayment: Double?

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Payment Overview")
                .font(.largeTitle)
                
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Past Months Average:")
                        .font(.subheadline)
                    if let averagePayment = averageLastThreeMonthsPayment {
                        Text("€\(averagePayment, specifier: "%.2f")")
                    } else {
                        Text("--")
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("This Month's Payment:")
                        .font(.subheadline)
                    if let currentPayment = currentMonthPayment {
                        Text("€\(currentPayment, specifier: "%.2f")")
                    } else {
                        Text("--")
                    }
                }
            }
            .padding()
            
            // Placeholder for the graph (if needed)
            Text("Graph Here")
                .frame(maxWidth: .infinity, minHeight: 200)
                .background(Color.gray.opacity(0.2))
                .padding()
        }
    }
}
