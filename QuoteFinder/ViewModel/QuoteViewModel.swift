//
//  QuoteViewModel.swift
//  QuoteFinder
//
//  Created by Hannu Packalen on 2025-04-03.
//

import Foundation

@Observable
class QuoteViewModel {
    
    //MARK: stored properties
    //The current quote we have retrieved from our endpoint.
    var currentQuote: Quote?
    
    var favouriteQuotes: [Quote] = []
    
    //MARK: Initializer(s)
    init(currentQuote: Quote? = nil) {
        
        self.currentQuote = currentQuote
        
        Task {
            await self.fetchQuote()
        }
    }
    
    func saveQuote() {
        
        if let currentQuote = self.currentQuote {
            favouriteQuotes.insert(currentQuote, at: 0)
        }
        
        print("There are \(favouriteQuotes.count) quotes saved")
    }
    
    func delete(_ quoteToDelete: Quote){
        favouriteQuotes.removeAll { currentQuote in
            currentQuote.id == quoteToDelete.id
        }
        
        print("There are \(favouriteQuotes.count) quotes saved")
        
    }
    // MARK: Function(s)
    
    // This loads a new quote from the endpoint
    //
    // "async" means it is an asynchronous function.
    //
    // That means it can be run alongside other functionality
    // in our app. Since this function might take a while to complete
    // this ensures that other parts of our app, such as the user
    // interface, won't "freeze up" while this function does it's job.
    func fetchQuote() async {
        
        let endpoint = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        // 2. Fetch the raw data from the URL
        //
        // Network requests can potentially fail (throw errors) so
        // we complete them within a do-catch block to report errors
        // if they occur.
        //
        do {
            
            // Fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Print the received data in the debug console
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            // 3. Decode the data into a Swift data type
            
            // Create a decoder object to do most of the work for us
            let decoder = JSONDecoder()
            
            // Use the decoder object to convert the raw data
            // into an instance of our Swift data type
            let decodedData = try decoder.decode(Quote.self, from: data)
            
            // If we got here, decoding succeeded,
            // return the instance of our data type
            self.currentQuote = decodedData
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error)
            
        }
        func loadFavouriteQuotes() {
            
            // Get a URL that points to the saved JSON data containing our list of favourite jokes
            let filename = getDocumentsDirectory().appendingPathComponent(fileLabel)
            
            print("Filename we are reading persisted jokes from is:")
            print(filename)
            
            // Attempt to load from the JSON in the stored file
            do {
                
                // Load the raw data
                let data = try Data(contentsOf: filename)
                
                print("Got data from file, contents are:")
                print(String(data: data, encoding: .utf8)!)
                
                // Decode the data into Swift native data structures
                self.favouriteQuotes = try JSONDecoder().decode([Quote].self, from: data)
                
            } catch {
                
                print(error)
                print("Could not load data from file, initializing with empty list.")
                
                self.favouriteQuotes = []
            }
            
        }
        
        // Write favourite jokes to file on device
        func persistFavouriteQuotes() {
            
            // Get a URL that points to the saved JSON data containing our list of people
            let filename = getDocumentsDirectory().appendingPathComponent(fileLabel)
            
            print("Filename we are writing persisted jokes to is is:")
            print(filename)
            
            do {
                
                // Create an encoder
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                
                // Encode the list of people we've tracked
                let data = try encoder.encode(self.favouriteQuotes)
                
                // Actually write the JSON file to the documents directory
                try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
                
                print("Wrote data to file, contents are:")
                print(String(data: data, encoding: .utf8)!)
                
                print("Saved data to documents directory successfully.")
                
            } catch {
                
                print(error)
                print("Unable to write list of favourite jokes to documents directory.")
            }
        }
    }
}
