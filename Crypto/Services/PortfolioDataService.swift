//
//  PortfolioDataService.swift
//  Crypto
//
//  Created by Frank Bara on 10/27/21.
//

import Foundation
import CoreData

/*
 Goes to CoreData to save and retrieve the portfolio holdings.
 */

class PorfolioDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading CoreData: \(error)")
            }
            
            self.getPortfolio()
        }
    }
    
    // MARK: - Public Function
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        // look for any id in the portfolio that has the same ID as the one passed into this function
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
            
        } else {
            add(coin: coin, amount: amount)
        }
        
    }
    
    
    // MARK: - Private Functions
    private func getPortfolio() {
        
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching portfolio entities: \(error)")
        }
        
    }
    
    private func add(coin: CoinModel, amount: Double) {
        
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func save() {
        
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to core data: \(error)")
        }
        
    }
    
    private func applyChanges() {
        // save the context then get them all again.
        save()
        getPortfolio()
        
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        
        entity.amount = amount
        applyChanges()
        
    }
    
    private func delete(entity: PortfolioEntity) {
        
        container.viewContext.delete(entity)
        applyChanges()
    }
    
}
