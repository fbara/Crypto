//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Frank Bara on 10/29/21.
//

import Foundation

import Foundation
import Combine

class CoinDetailDataService {
    
    // using a publisher because it can have subscribers.
    // when the publisher gets new data, all subscribers get notified of new data.
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        
        guard let url = URL(string:"https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                // the url we're using just returns once so it's a good idea to cancel it when we get the data.
                self?.coinDetailSubscription?.cancel()
            })
    }
}
