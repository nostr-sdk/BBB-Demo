//
//  NotePoster.swift
//  BBB Nostr Demo
//
//  Created by Bryan Montz on 4/6/24.
//

import Foundation

class NotePoster {
    
    static let shared = NotePoster()
    
    func post(_ content: String) {
        print("NotePoster will post: \(content)")
    }
}
