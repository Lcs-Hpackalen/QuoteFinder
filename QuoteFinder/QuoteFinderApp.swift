//
//  QuoteFinderApp.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import SwiftUI

@main
struct QuoteFinderApp: App {
    //MARK: Stored Properties
    @State var viewModel = QuoteViewModel()
    
    //MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environment(viewModel)
        }
    }
}
