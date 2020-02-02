//
//  ViewController.swift
//  Concentration
//
//  Created by Pavel Suvit on 07/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import UIKit

class FirstLevelViewController: UIViewController {
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    
    var viewModel: GameViewModel! {
        didSet {
            viewModel.cardUpdateCallback = { [weak self] position in
                switch position {
                case 0:
                    self?.updateFirstCard(card: (self?.viewModel.cards[position])!)
                case 1:
                    self?.updateSecondCard(card: (self?.viewModel.cards[position])!)
                case 2:
                    self?.updateThirdCard(card: (self?.viewModel.cards[position])!)
                case 3:
                    self?.updateFourthCard(card: (self?.viewModel.cards[position])!)
                default:
                    return
                }
            }
            viewModel.dialogCallback = { [weak self] textToShow in
                let alert = UIAlertController.init(title: "Congrats", message: textToShow, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self?.navigationController?.popViewController(animated: true)
                    }))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .darkGray
        viewModel = GameViewModel(cardsRepository: CardsRepositoryImpl(), delayProvider: AsyncAfterDelayProvider())
        viewModel.startGameForLevel(level: 1)
        firstBtn.setBackgroundImage(UIImage(named: viewModel.cards[0].imageToShow), for: UIControl.State.normal)
        secondBtn.setBackgroundImage(UIImage(named: viewModel.cards[1].imageToShow), for: UIControl.State.normal)
        thirdBtn.setBackgroundImage(UIImage(named: viewModel.cards[2].imageToShow), for: UIControl.State.normal)
        fourthBtn.setBackgroundImage(UIImage(named: viewModel.cards[3].imageToShow), for: UIControl.State.normal)
    }
    
    private func updateFirstCard(card: Card) {
        if (card.state == .gone) {
            UIView.transition(with: self.firstBtn, duration: 1, options: .showHideTransitionViews, animations: { self.firstBtn.alpha = 0.0 })
        } else {
            firstBtn.setBackgroundImage(UIImage(named: card.imageToShow), for: UIControl.State.normal)
        }
    }
    
    private func updateSecondCard(card: Card) {
        if (card.state == .gone) {
            UIView.transition(with: self.secondBtn, duration: 1, options: .showHideTransitionViews, animations: { self.secondBtn.alpha = 0.0 })
        } else {
            secondBtn.setBackgroundImage(UIImage(named: card.imageToShow), for: UIControl.State.normal)
        }
    }
    
    private func updateThirdCard(card: Card) {
        if (card.state == .gone) {
            UIView.transition(with: self.thirdBtn, duration: 1, options: .showHideTransitionViews, animations: { self.thirdBtn.alpha = 0.0 })
        } else {
            thirdBtn.setBackgroundImage(UIImage(named: card.imageToShow), for: UIControl.State.normal)
        }
    }
    
    private func updateFourthCard(card: Card) {
        if (card.state == .gone) {
            UIView.transition(with: self.fourthBtn, duration: 1, options: .showHideTransitionViews, animations: { self.fourthBtn.alpha = 0.0 })
        } else {
            fourthBtn.setBackgroundImage(UIImage(named: card.imageToShow), for: UIControl.State.normal)
        }
    }
    
    @IBAction func onFirstBtnClick(_ sender: Any) {
        viewModel.onCardClick(position: 0)
    }
    
    @IBAction func onSecondBtnClick(_ sender: Any) {
        viewModel.onCardClick(position: 1)
    }
    
    @IBAction func onThirdBtnClick(_ sender: Any) {
        viewModel.onCardClick(position: 2)
    }
    
    @IBAction func onFourthBtnClick(_ sender: Any) {
        viewModel.onCardClick(position: 3)
    }
}

