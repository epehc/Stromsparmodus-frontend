//
//  AdminContentView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 18.01.24.
//

import Foundation
import SwiftUI

struct AdminContentView: View {
    var body: some View {
        TabView {
            AdminDashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }

            AdminUsersView()
                .tabItem {
                    Label("Users", systemImage: "person.2")
                }

            AdminEnergyUsageView()
                .tabItem {
                    Label("Usage", systemImage: "chart.bar")
                }

            AdminPaymentMonitoringView()
                .tabItem {
                    Label("Payments", systemImage: "creditcard")
                }
        }
    }
}

struct AdminContentView_Previews: PreviewProvider {
    static var previews: some View {
        AdminContentView()
    }
}
