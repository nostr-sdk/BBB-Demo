//
//  PostingView.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import Foundation
import SwiftUI

struct PostingView: View {
    @State private var noteContent = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $noteContent)
                .focused($isFocused)
                .foregroundColor(.white)
                .padding(16)
                .background(Color.gray)
            
            HStack {
                Spacer()
                Button("Post", action: post)
            }
        }
        .padding(20)
    }
    
    func post() {
        NotePoster.shared.post(noteContent)
        
        noteContent = ""
        isFocused = false
    }
}

#Preview {
    PostingView()
}
