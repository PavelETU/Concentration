//
//  CardsRepositoryImpl.swift
//  Concentration
//
//  Created by Pavel Suvit on 10/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

class CardsRepositoryImpl: CardsRepository {
    
    var pictures = ["Pineapple", "Cherry", "Apple", "Avocado", "Broccoli", "Coconut", "Grape", "Lemon"]
    
    func provideCards(amountOfCards: Int) -> [Card] {
        var cards = [Card]()
        var picturesToUse = [String]()
        for _ in 0..<amountOfCards/2 {
            let valudeToAdd = pictures.remove(at: Int.random(in: 0..<pictures.count))
            picturesToUse.append(valudeToAdd)
            picturesToUse.append(valudeToAdd)
        }
        for _ in 0..<amountOfCards {
            cards.append(Card(backgroundImage: picturesToUse.remove(at: Int.random(in: 0..<picturesToUse.count))))
        }
        return cards
    }
}
