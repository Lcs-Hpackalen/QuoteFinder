//
//  LandingView.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-04.
//

import SwiftUI

struct LandingView: View {
    //MARK: stored properties
    
    @State var currentTab = 0
    
    //MARK: Computed Properties
    var body: some View {
        TabView(selection: $currentTab) {
            
            QuoteView()
                .tabItem {
                    Label {
                        Text("New Quotes")
                    } icon: {
                        Image(systemName: "smiley")
                    }
                }
                .tag(1)
            FavouriteQuotesView()
                .tabItem {
                    Label {
                        Text("Favourite Quotes")
                    } icon: {
                        Image(systemName: "heart.fill")
                    }
                }
                .tag(2)
        }
    }
}

#Preview {
    LandingView()
        .environment(QuoteViewModel())
}
