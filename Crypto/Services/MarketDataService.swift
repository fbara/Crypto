//
//  MarketDataService.swift
//  Crypto
//
//  Created by Frank Bara on 10/25/21.
//

import Foundation
import Combine

class MarketDataService {
    
    // using a publisher because it can have subscribers.
    // when the publisher gets new data, all subscribers get notified of new data.
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        
        guard let url = URL(string:"https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                // the url we're using just returns once so it's a good idea to cancel it when we get the data.
                self?.marketDataSubscription?.cancel()
            })
    }
}
