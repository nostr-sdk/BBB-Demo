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
    @StateObject var relayPool = try! RelayPool(relayURLs: [
        URL(string: "wss://relay.damus.io")!,
        URL(string: "wss://relay.snort.social")!,
        URL(string: "wss://nos.lol")!
    ])
    
    var body: some Scene {
        WindowGroup {
            TopLevelView()
                .environmentObject(relayPool)
        }
    }
}
