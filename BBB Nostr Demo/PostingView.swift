//
//  PostingView.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import Foundation
import NostrSDK
import SwiftUI

struct PostingView: View, EventCreating {
    @EnvironmentObject var relayPool: RelayPool
    @State private var noteContent = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $noteContent)
                .focused($isFocused)
                .foregroundColor(.white)
                .frame(minHeight: 80)
                .padding(16)
                .background(Color.gray)
                .cornerRadius(16)
            
            HStack {
                Spacer()
                Button("Post", action: post)
            }
            .padding(.top, 12)
        }
        .padding(20)
    }
    
    func post() {
        let keys = Keypair(nsec: "")!   // Update nsec to make this work
        let note = try! textNote(withContent: noteContent, signedBy: keys)
        
        relayPool.publishEvent(note)
        
        noteContent = ""
        isFocused = false
    }
}

#Preview {
    PostingView()
}
