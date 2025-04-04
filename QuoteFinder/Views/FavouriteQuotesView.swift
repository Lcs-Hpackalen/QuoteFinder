//
//  FavouriteQuotesView.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-04.
//

import SwiftUI

struct FavouriteQuotesView: View {
    //MARK: Stored Properties
    
    @Environment(QuoteViewModel.self) var viewModel
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.favouriteQuotes.isEmpty{
                    ContentUnavailableView("There are no quotes favourited", image: "heart.slash", description: Text("Try seeing if any quotes hit deep"))
                    }
                else {
                    
                    Text("There are \(viewModel.favouriteQuotes.count) favourite quotes")
                }
                
            }
            .navigationTitle("Favourite Quotes")
        }
    }
}

#Preview {
    FavouriteQuotesView()
        .environment(QuoteViewModel())
}
