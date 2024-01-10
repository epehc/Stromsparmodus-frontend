//
//  ContentView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "sun.max.fill")
                }
            EnergyUsageView()
                .tabItem {
                    Label("Energy Usage", systemImage: "chart.bar")
                }
            PaymentHistoryView()
                .tabItem{
                    Label("Payments", systemImage: "creditcard.fill")
                }
        }
    }
}



#Preview {
    ContentView()
}
