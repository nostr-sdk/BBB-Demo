//
//  BBB_Nostr_DemoApp.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import NostrSDK
import SwiftUI

@main
struct BBB_Nostr_DemoApp: App {
    // Toggle between the two users by commenting/uncommenting below.
    let users = Users(thisUser: User.bob, otherUser: User.alice)
//    let users = Users(thisUser: User.alice, otherUser: User.bob)
    
    @StateObject var relayPool = try! RelayPool(relayURLs: [
        URL(string: "wss://relay.damus.io")!,
        URL(string: "wss://relay.snort.social")!,
        URL(string: "wss://nos.lol")!
    ])
    
    var body: some Scene {
        WindowGroup {
            TopLevelView()
                .environmentObject(relayPool)
                .environmentObject(users)
        }
    }
}

class Users: ObservableObject {
    let thisUser: User
    let otherUser: User
    
    init(thisUser: User, otherUser: User) {
        self.thisUser = thisUser
        self.otherUser = otherUser
    }
}

class User: ObservableObject {
    let name: String
    let keypair: Keypair
    
    init(name: String, keypair: Keypair) {
        self.name = name
        self.keypair = keypair
    }
    
    static let bob = User(name: "Bob",
                          keypair: Keypair(nsec: "")!)
    
    static let alice = User(name: "Alice",
                            keypair: Keypair(nsec: "")!)
}
