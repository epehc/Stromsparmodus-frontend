//
//  AdminUsersView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 18.01.24.
//

import Foundation
import SwiftUI

struct AdminUsersView: View {
    let users = ["Alice", "Bob", "Charlie"] // Placeholder for actual user data

    var body: some View {
        List(users, id: \.self) { user in
            NavigationLink(destination: AdminUserDetailView(user: user)) {
                Text(user)
            }
        }
        .navigationTitle("Users")
    }
}

struct AdminUserDetailView: View {
    var user: String

    var body: some View {
        Text("Details for \(user)")
        // More detailed view for user management
    }
}
