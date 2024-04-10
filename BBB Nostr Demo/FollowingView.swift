//
//  FollowingView.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import Combine
import Foundation
import NostrSDK
import SwiftUI

struct FollowingView: View {
    @EnvironmentObject var relayPool: RelayPool
    @EnvironmentObject var users: Users
    
    @State private var events: [NostrEvent] = []
    @State private var eventsCancellable: AnyCancellable?
    
    var body: some View {
        VStack {
            Text("\(users.otherUser.name)'s notes")
            
            List(events.sorted(by: { $0.createdDate > $1.createdDate }), id: \.id) { event in
                Text("\(event.content)")
            }
        }
        .onAppear {
            let filter = Filter(authors: [users.otherUser.keypair.publicKey.hex],
                                kinds: [EventKind.textNote.rawValue])
            _ = relayPool.subscribe(with: filter)
            
            eventsCancellable = relayPool.events
                .receive(on: DispatchQueue.main)
                .map { $0.event }
                .sink { event in
                    if !events.contains(where: { $0.id == event.id }) {
                        events.insert(event, at: 0)
                    }
                }
        }
    }
}
