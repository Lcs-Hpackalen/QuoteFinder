//
//  Quote.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import Foundation

struct Quote: Identifiable, Codable {
    let id: String
    let quote: String
    let author: String
}

