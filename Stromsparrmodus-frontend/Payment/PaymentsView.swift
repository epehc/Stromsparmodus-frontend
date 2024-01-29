//
//  PaymentsView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 28.01.24.
//

import Foundation
import SwiftUI

struct PaymentsView: View {
   
    @State private var averageLastMonthUsage: Double?
    @State private var currentMonthUsage: Double?
    @ObservedObject var paymentDataStore: PaymentDataStore
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ScrollView{
                VStack {
                    PaymentsOverviewView(
                        paymentDataStore: paymentDataStore,
                        averageLastThreeMonthsPayment: paymentDataStore.calculateAveragePaymentForPastMonths(),
                        currentMonthPayment: paymentDataStore.calculateCurrentMonthPayment()
                    )
                    
                    Spacer()
                    
                    PaymentsHistoryView(paymentDataStore: paymentDataStore)
                    
                    
                    
                }
                .padding()
                
            }
        }
        .onAppear {
            paymentDataStore.loadPayments()
        }
    }
}
