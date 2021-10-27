//
//  CoinDataService.swift
//  Crypto
//
//  Created by Frank Bara on 10/22/21.
//

import Foundation
import Combine

class CoinDataService {
    
    // using a publisher because it can have subscribers.
    // when the publisher gets new data, all subscribers get notified of new data.
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        
        guard let url = URL(string:"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                // the url we're using just returns once so it's a good idea to cancel it when we get the data.
                self?.coinSubscription?.cancel()
            })
    }
}
