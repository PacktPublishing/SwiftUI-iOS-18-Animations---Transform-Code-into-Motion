//
//  MakeFriendsView.swift
//  Blob Splash Screen
//
//  Created by Ron Erez on 29/11/2024.
//

import SwiftUI

struct MakeFriendsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Make Friends")
                    .font(.title)
                    .bold()
                    .padding()
                Text("Explore and connect with new people!")
                    .foregroundStyle(.secondary)
                    .padding()
                NavigationLink("Profile Page") {
                    Text("Go to Profile")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                }
                
            }
            .navigationTitle("Make Friends App")
        }
    }
}

#Preview {
    MakeFriendsView()
}
