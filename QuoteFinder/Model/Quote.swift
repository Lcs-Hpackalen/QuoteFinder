//
//  Quote.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import Foundation

struct Quote: Identifiable, Codable {
    
    //MARK: Stored Properties
    let id = UUID()
    let quoteAuthor: String?
    let quoteText: String?
    
    //MARK: Computed Properties
    var AuthorAndQuote: String {
        
        if let author = self.quoteAuthor, let quote = self.quoteText {
            return "\(quote)\n\n\(author)"
        } else {
            return ""
        }
        
    }
}
