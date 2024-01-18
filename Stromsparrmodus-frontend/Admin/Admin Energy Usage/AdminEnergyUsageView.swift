//
//  AdminEnergyUsageView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 18.01.24.
//

import Foundation
import SwiftUI

struct AdminEnergyUsageView: View {
    let usersEnergyUsage = [("Alice", 340), ("Bob", 415), ("Charlie", 300)] // Placeholder for actual data

    var body: some View {
        List(usersEnergyUsage, id: \.0) { userUsage in
            NavigationLink(destination: AdminUserEnergyUsageDetailView(userName: userUsage.0, energyUsage: userUsage.1)) {
                HStack {
                    Text(userUsage.0)
                    Spacer()
                    Text("\(userUsage.1) kWh")
                }
            }
        }
        .navigationTitle("Energy Usage")
    }
}

struct AdminUserEnergyUsageDetailView: View {
    var userName: String
    var energyUsage: Int

    var body: some View {
        VStack {
            Text("Usage for \(userName): \(energyUsage) kWh")
            // Further details and historical usage graphs
        }
    }
}
