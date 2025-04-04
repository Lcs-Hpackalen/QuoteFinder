//
//  FavouriteQuotesView.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-04.
//

import SwiftUI

struct FavouriteQuotesView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("This will show favourite quotes")
            }
            .navigationTitle("Favourite Quotes")
        }
    }
}

#Preview {
    FavouriteQuotesView()
}
