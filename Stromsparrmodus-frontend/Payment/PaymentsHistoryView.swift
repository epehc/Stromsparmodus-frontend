//
//  PaymentsHistoryView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 29.01.24.
//

import Foundation
import SwiftUI

//To display the List of past payments
struct PaymentsHistoryView: View {
    @State private var showPaymentEntry = false
    @ObservedObject var paymentDataStore: PaymentDataStore
    @State private var expandedPaymentID: UUID?

    var body: some View {
            VStack(alignment: .leading) {
                HStack{
                    Text("Payment History")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showPaymentEntry.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(15)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding()
                    .sheet(isPresented: $showPaymentEntry) {
                        PaymentEntryView(paymentDataStore: paymentDataStore)
                    }
                }
            
                
                ForEach(paymentDataStore.payments.sorted { $0.date > $1.date }) { payment in
                    PaymentHistoryItemView(payment: payment, isExpanded: .constant(expandedPaymentID == payment.id), onDelete: {
                        paymentDataStore.deletePayment(payment)
                    })
                    .onTapGesture {
                        withAnimation {
                            expandedPaymentID = (expandedPaymentID == payment.id) ? nil : payment.id
                        }
                    }
                }
            }
        
    }
    
    private func deletePayment(at offsets: IndexSet) {
        offsets.forEach { index in
            let payment = paymentDataStore.payments.sorted { $0.date > $1.date }[index]
            paymentDataStore.deletePayment(payment)
        }
    }

}
