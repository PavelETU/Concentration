//
//  CardsRepositoryImpl.swift
//  Concentration
//
//  Created by Pavel Suvit on 10/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

class CardsRepositoryImpl: CardsRepository {
    func provideCards(amountOfCards: Int) -> [Card] {
        var cards = [Card]()
        if (amountOfCards == 4) {
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
        }
        if (amountOfCards == 8) {
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
        }
        if (amountOfCards == 16) {
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Pineapple"))
            cards.append(Card(backgroundImage: "Cherry"))
            cards.append(Card(backgroundImage: "Cherry"))
        }
        return cards
    }
}
