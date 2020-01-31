//
//  GameViewModel.swift
//  Concentration
//
//  Created by Pavel Suvit on 07/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

class GameViewModel {
    init(cardsRepository: CardsRepository, delayProvider: DelayProvider) {
        self.repo = cardsRepository
        self.delayProvider = delayProvider
    }
    
    var cards: [Card]!
    var cardUpdateCallback: ((Int) -> Void)?
    var dialogCallback: ((String) -> Void)?
    var amountOfCards: Int!
    
    private var repo: CardsRepository
    private var delayProvider: DelayProvider
    private var openedCardsCount = 0
    private var imageOfOpenCard = ""
    private var openedCardNumber: Int!
    
    func startGameForLevel(level: Int) {
        switch level {
        case 1: amountOfCards = 4
        case 2: amountOfCards = 8
        case 3: amountOfCards = 16
        default: amountOfCards = 4
        }
        cards = repo.provideCards(amountOfCards: amountOfCards)
        
    }
    
    func onCardClick(position: Int) {
        openedCardsCount += 1
        let imageOfCard = cards[position].backgroundImage
        if (openedCardsCount == 2) {
            if (openedCardNumber == position) {
                openedCardsCount -= 1
                return
            }
            cards[position].imageToShow = imageOfCard!
            cardUpdateCallback?(position)
            if (cards[openedCardNumber].backgroundImage == imageOfCard) {
                hideCard(position: position)
                hideCard(position: openedCardNumber)
                checkWinConditionsAndDisplayDialogIfGameIsOver()
            } else {
                setImageForCardWithAnimation(position: openedCardNumber, picture: "Backframe")
                setImageForCardWithAnimation(position: position, picture: "Backframe")
            }
            openedCardsCount = 0
        } else {
            openedCardNumber = position
            cards[position].imageToShow = imageOfCard!
            cardUpdateCallback?(position)
        }
    }
    
    private func hideCard(position: Int) {
        cards[position].state = .gone
        cardUpdateCallback?(position)
    }
    
    private func setImageForCardWithAnimation(position: Int, picture: String) {
        delayProvider.runFunctionWithDelay(delayByMilliseconds: 700, function: { [weak self] in
            self?.cards[position].imageToShow = picture
            self?.cardUpdateCallback?(position)
        })
    }
    
    private func checkWinConditionsAndDisplayDialogIfGameIsOver() {
        var gameWon = true
        for card in cards {
            if (card.state == .showing) {
                gameWon = false
                break
            }
        }
        if (gameWon) {
            dialogCallback?("You win! Congrats!")
        }
    }
}
