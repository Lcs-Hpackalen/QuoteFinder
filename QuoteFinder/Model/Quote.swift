//
//  Quote.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import Foundation

struct Quote: Identifiable, Codable {
    let id = UUID()
    let quoteAuthor: String?
    let quoteText: String?
}
