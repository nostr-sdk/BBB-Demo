//
//  TopLevelView.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import Foundation
import SwiftUI

struct TopLevelView: View {
    var body: some View {
        TabView {
            PostingView()
                .tabItem {
                    Label("Posting", systemImage: "1.circle")
                }
            
            FollowingView()
                .tabItem {
                    Label("Following", systemImage: "2.circle")
                }
        }
    }
}
