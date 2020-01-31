//
//  Card.swift
//  Concentration
//
//  Created by Pavel Suvit on 31/01/2020.
//  Copyright © 2020 Pavel Suvit. All rights reserved.
//

import Foundation
class Card {
    var imageToShow: String = "Backframe"
    var state: CardState = .showing
    var backgroundImage: String!
    
    init(backgroundImage: String) {
        self.backgroundImage = backgroundImage
    }
    
    enum CardState {
        case showing
        case gone
    }
}
