//
//  CardsRepositoryImpl.swift
//  Concentration
//
//  Created by Pavel Suvit on 10/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

class CardsRepositoryImpl: CardsRepository {
    func getCardNameForRowAndCol(row: Int, col: Int) -> String {
        if ((row == 0 && col == 0) || (row == 1 && col == 0)) {
            return "CherryImage"
        } else {
            return "Pineapple"
        }
    }
}
