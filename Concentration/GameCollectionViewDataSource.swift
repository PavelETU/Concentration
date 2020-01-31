//
//  GameCollectionViewDataSource.swift
//  Concentration
//
//  Created by Pavel Suvit on 13/01/2020.
//  Copyright © 2020 Pavel Suvit. All rights reserved.
//

import UIKit

class GameCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let identifier = "cell"
    private var gameViewModel: GameViewModel!
    
    init(gameViewModel: GameViewModel) {
        super.init()
        self.gameViewModel = gameViewModel
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameViewModel.amountOfCards
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath as IndexPath) as! CardCollectionViewCell
        let card = gameViewModel.cards[indexPath.item]
        if (card.state == .gone) {
            UIView.transition(with: cell, duration: 1, options: .showHideTransitionViews, animations: { cell.alpha = 0.0 })
        } else {
            cell.card.image = UIImage(named: card.imageToShow)
        }
        return cell
    }
    
}
