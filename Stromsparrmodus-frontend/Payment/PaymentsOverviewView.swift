//
//  PaymentsOverviewView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 29.01.24.
//

import Foundation
import SwiftUI

//Displays the average of the past payments, the latest payment, and a graph to compare them
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
