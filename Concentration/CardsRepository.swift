//
//  CardsRepository.swift
//  Concentration
//
//  Created by Pavel Suvit on 10/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

protocol CardsRepository {
    func provideCards(amountOfCards: Int) -> [Card]
}
