//
//  AdminDashboardView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 18.01.24.
//

import Foundation
import SwiftUI

struct AdminDashboardView: View {
    var body: some View {
        VStack {
            // A mock summary view for total energy usage
            Text("Total Energy Usage Summary")
                .font(.title)
            // More widgets and summaries could be added here
        }
        .padding()
        .navigationTitle("Admin Dashboard")
    }
}

