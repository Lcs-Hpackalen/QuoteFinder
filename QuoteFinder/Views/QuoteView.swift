//
//  ContentView.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import SwiftUI

struct QuoteView: View {
    //MARK: Stored Properties
    @State var viewModel = QuoteViewModel()
    
    //MARK: Computed Properties
    var body: some View {
        VStack {
            
            if let currentQuote = viewModel.currentQuote {
                
                Group{
                    Text(currentQuote.quote)
                        .padding(.bottom, 100)
                    
                    Text(currentQuote.author)
                        .font(.caption)
                }
                .font(.title)
                .multilineTextAlignment(.center)
                Button {
                    Task {
                        await viewModel.fetchQuote()
                    }
                } label: {
                    Text("New Quote")
                        .buttonStyle(.borderedProminent)
                }

            }
        }
        .padding()
    }
}

#Preview {
    QuoteView()
}
