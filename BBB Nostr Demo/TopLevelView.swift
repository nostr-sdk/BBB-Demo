//
//  TopLevelView.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import Foundation
import SwiftUI

struct TopLevelView: View {
    @EnvironmentObject var users: Users
    
    var body: some View {
        TabView {
            Color.white
                .tabItem {
                    Label(users.thisUser.name, systemImage: "person.circle.fill")
                }
            
            PostingView()
                .tabItem {
                    Label("Posting", systemImage: "square.and.pencil.circle.fill")
                }
            
            FollowingView()
                .tabItem {
                    Label("Following", systemImage: "person.2.circle.fill")
                }
        }
    }
}
