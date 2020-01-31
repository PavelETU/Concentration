//
//  SecondLevelViewContoller.swift
//  Concentration
//
//  Created by Pavel Suvit on 13/01/2020.
//  Copyright © 2020 Pavel Suvit. All rights reserved.
//

import UIKit

class SecondLevelViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let identifier = "cell"
    private var gameViewModel: GameViewModel! {
        didSet {
            gameViewModel.cardUpdateCallback = { [weak self] position in
                self?.collectionView.reloadItems(at: [IndexPath(item: position, section: 0)])
            }
        }
    }
    private var dataSource: GameCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameViewModel = GameViewModel(cardsRepository: CardsRepositoryImpl(), delayProvider: AsyncAfterDelayProvider())
        
        gameViewModel.startGameForLevel(level: 2)
        dataSource = GameCollectionViewDataSource(gameViewModel: gameViewModel)
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        gameViewModel.dialogCallback = { [weak self] textToShow in
            let alert = UIAlertController.init(title: "Congrats", message: textToShow, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self?.navigationController?.popViewController(animated: true)
                }))
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameViewModel.onCardClick(position: indexPath.row)
    }
    
}
