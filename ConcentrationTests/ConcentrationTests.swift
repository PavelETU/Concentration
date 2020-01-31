//
//  ConcentrationTests.swift
//  ConcentrationTests
//
//  Created by Pavel Suvit on 07/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import XCTest
@testable import Concentration

class ConcentrationTests: XCTestCase {
    
    private var viewModel: GameViewModel!

    override func setUp() {
        viewModel = GameViewModel(cardsRepository: CardsRepositoryMock(), delayProvider: DelayProviderMock())
    }
    
    func testThereAreFourCardsForFirstLevel() {
        viewModel.startGameForLevel(level: 1)
        
        XCTAssertEqual(viewModel.amountOfCards, 4)
    }
    
    func testThereAreEightCardsForSecondLevel() {
        viewModel.startGameForLevel(level: 2)
        
        XCTAssertEqual(viewModel.amountOfCards, 8)
    }
    
    func testThereAreSixtennCardsForThirdLevel() {
        viewModel.startGameForLevel(level: 3)
        
        XCTAssertEqual(viewModel.amountOfCards, 16)
    }

    func testAllCardsTurnedDownInitially() {
        viewModel.startGameForLevel(level: 1)
        
        XCTAssertTrue(viewModel.cards[0].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[1].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[2].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[3].imageToShow == "Backframe")
    }
    
    func testFirstClick() {
        viewModel.startGameForLevel(level: 1)
        viewModel.onCardClick(position: 0)
        
        XCTAssertTrue(viewModel.cards[0].imageToShow == "first")
        XCTAssertTrue(viewModel.cards[1].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[2].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[3].imageToShow == "Backframe")
    }
    
    func testAfterClickOnTwoSameCardsTheyWouldGetDissapeared() {
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 1)
        
        XCTAssertTrue(viewModel.cards[0].state == .gone)
        XCTAssertTrue(viewModel.cards[1].state == .gone)
    }
    
    func testAfterClickOnTwoSameCardsTheyWouldGetDissapearedNoMatterHowManyTimesYouClick() {
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 1)
        
        XCTAssertTrue(viewModel.cards[0].state == .gone)
        XCTAssertTrue(viewModel.cards[1].state == .gone)
    }
    
    func testFirstCardDoesNotOpenTwice() {
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 0)
        
        XCTAssertTrue(viewModel.cards[0].state == .showing)
    }
    
    func testAllCardsDissapeared() {
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 2)
        viewModel.onCardClick(position: 3)
        
        XCTAssertTrue(viewModel.cards[0].state == .gone)
        XCTAssertTrue(viewModel.cards[1].state == .gone)
        XCTAssertTrue(viewModel.cards[2].state == .gone)
        XCTAssertTrue(viewModel.cards[3].state == .gone)
    }
    
    func testCardsGoToInitialStateWhenTheyAreNotTheSame() {
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 2)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 3)
        
        XCTAssertTrue(viewModel.cards[0].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[1].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[2].imageToShow == "Backframe")
        XCTAssertTrue(viewModel.cards[3].imageToShow == "Backframe")
    }
    
    func testDisplayWinDialogWhenGameIsOver() {
        var messageToDisplay: String!
        viewModel.dialogCallback = { messageToDisplayInDialog in
            messageToDisplay = messageToDisplayInDialog
        }
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 2)
        viewModel.onCardClick(position: 3)
        
        XCTAssertTrue(messageToDisplay == "You win! Congrats!")
    }
    
    func testDisplayWinDialogWhenGameIsOverOtherCombination() {
        var messageToDisplay: String!
        viewModel.dialogCallback = { messageToDisplayInDialog in
            messageToDisplay = messageToDisplayInDialog
        }
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 2)
        viewModel.onCardClick(position: 3)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 1)
        
        XCTAssertTrue(messageToDisplay == "You win! Congrats!")
    }
    
    func testDisplayWinDialogWhenGameIsOver2() {
        var messageToDisplay: String!
        viewModel.dialogCallback = { messageToDisplayInDialog in
            messageToDisplay = messageToDisplayInDialog
        }
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 0)
        viewModel.onCardClick(position: 3)
        viewModel.onCardClick(position: 2)
        
        XCTAssertTrue(messageToDisplay == "You win! Congrats!")
    }
    
    func testDisplayWinDialogWhenGameIsOverOtherCombination2() {
        var messageToDisplay: String!
        viewModel.dialogCallback = { messageToDisplayInDialog in
            messageToDisplay = messageToDisplayInDialog
        }
        viewModel.startGameForLevel(level: 1)
        
        viewModel.onCardClick(position: 3)
        viewModel.onCardClick(position: 2)
        viewModel.onCardClick(position: 1)
        viewModel.onCardClick(position: 0)
        
        XCTAssertTrue(messageToDisplay == "You win! Congrats!")
    }
}

private class CardsRepositoryMock: CardsRepository {
    func provideCards(amountOfCards: Int) -> [Card] {
        var cards = [Card]()
        cards.append(Card(backgroundImage: "first"))
        cards.append(Card(backgroundImage: "first"))
        cards.append(Card(backgroundImage: "second"))
        cards.append(Card(backgroundImage: "second"))
        return cards
    }
}

private class DelayProviderMock: DelayProvider {
    func runFunctionWithDelay(delayByMilliseconds: Int, function: @escaping () -> Void) {
        function()
    }
}
