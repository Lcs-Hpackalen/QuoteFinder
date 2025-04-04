//
//  ContentView.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import SwiftUI

struct QuoteView: View {
    //MARK: Stored Properties
    
    @Environment(QuoteViewModel.self) var viewModel
    
    @State  var quoteHasBeenSaved = false
    
    //MARK: Computed Properties
    var body: some View {
        NavigationStack{
            VStack {
                Button {
                    Task {
                        await viewModel.fetchQuote()
                        
                        quoteHasBeenSaved = false
                    }
                } label: {
                    Text("New Quote")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                if let currentQuote = viewModel.currentQuote {
                    
                    Group{
                        Text(currentQuote.quoteText ?? "")
                            .padding(.bottom, 100)
                        
                        Text(currentQuote.quoteAuthor ?? "")
                            .padding(.bottom, 50)
                    }
                    .font(.title)
                    .multilineTextAlignment(.center)
                    
                    Button {
                        Task{
                            viewModel.saveQuote()
                            
                            await viewModel.fetchQuote()
                            
                            quoteHasBeenSaved = true
                            quoteHasBeenSaved = false
                        }
                    } label: {
                        Text("Save quote")
                    }
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, 20)
                    .disabled(quoteHasBeenSaved)
                    
                    
                    
                }
            }
            .navigationTitle("Quotes & Authors")
        }
       
        .padding()
    }
}

#Preview {
    QuoteView()
        .environment(QuoteViewModel())
}
