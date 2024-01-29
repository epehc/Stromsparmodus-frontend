//
//  ContentView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var paymentDataStore = PaymentDataStore()

    var body: some View {
        TabView {
            DashboardView(paymentDataStore: paymentDataStore)
                .tabItem {
                    Label("Dashboard", systemImage: "sun.max.fill")
                }
            EnergyUsageView()
                .tabItem {
                    Label("Energy Usage", systemImage: "chart.bar")
                }
            PaymentsView(paymentDataStore: paymentDataStore)
                .tabItem{
                    Label("Payments", systemImage: "creditcard.fill")
                }
        }
    }
}

