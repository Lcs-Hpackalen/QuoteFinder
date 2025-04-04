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
                    List(viewModel.favouriteQuotes) { currentQuote in VStack(alignment: .leading, spacing: 5){
                        Text(currentQuote.quoteText ?? "")
                        Text(currentQuote.quoteAuthor ?? "")
                            .italic()
                    }
                    }
                    .listStyle(.plain)
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
