//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Frank Bara on 10/29/21.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .sink { (returnedCoinDetails) in
                print("received coin detail data.")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
    
}
