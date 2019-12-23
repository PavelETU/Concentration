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

    func testAllCardsTurnedDownInitially() {
        var firstButtonTitle: String!
        var secondButtonTitle: String!
        var thirdButtonTitle: String!
        var fourthButtonTitle: String!
        viewModel.firstBtnPictureCallback = { fileName in
            firstButtonTitle = fileName
        }
        viewModel.secondBtnPictureCallback = { fileName in
            secondButtonTitle = fileName
        }
        viewModel.thirdBtnPictureCallback = { fileName in
            thirdButtonTitle = fileName
        }
        viewModel.fourthBtnPictureCallback = { fileName in
            fourthButtonTitle = fileName
        }
        
        viewModel.startGame()
        
        XCTAssertTrue(firstButtonTitle == "Backframe")
        XCTAssertTrue(secondButtonTitle == "Backframe")
        XCTAssertTrue(thirdButtonTitle == "Backframe")
        XCTAssertTrue(fourthButtonTitle == "Backframe")
    }
    
    func testFirstClick() {
        var firstButtonTitle: String!
        var secondButtonTitle: String!
        var thirdButtonTitle: String!
        var fourthButtonTitle: String!
        viewModel.firstBtnPictureCallback = { fileName in
            firstButtonTitle = fileName
        }
        viewModel.secondBtnPictureCallback = { fileName in
            secondButtonTitle = fileName
        }
        viewModel.thirdBtnPictureCallback = { fileName in
            thirdButtonTitle = fileName
        }
        viewModel.fourthBtnPictureCallback = { fileName in
            fourthButtonTitle = fileName
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        
        XCTAssertTrue(firstButtonTitle == "First")
        XCTAssertTrue(secondButtonTitle == "Backframe")
        XCTAssertTrue(thirdButtonTitle == "Backframe")
        XCTAssertTrue(fourthButtonTitle == "Backframe")
    }
    
    func testAfterClickOnTwoSameCardsTheyWouldGetDissapeared() {
        var firstButtonVisibility: Bool!
        var thirdButtonVisibility: Bool!
        viewModel.firstBtnVisibilityCallback = { visibility in
            firstButtonVisibility = visibility
        }
        viewModel.thirdBtnVisibilityCallback = { visibility in
            thirdButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        viewModel.onThirdButtonClick()
        
        XCTAssertFalse(firstButtonVisibility)
        XCTAssertFalse(thirdButtonVisibility)
    }
    
    func testAfterClickOnTwoSameCardsTheyWouldGetDissapearedNoMatterHowManyTimesYouClick() {
        var firstButtonVisibility: Bool!
        var thirdButtonVisibility: Bool!
        viewModel.firstBtnVisibilityCallback = { visibility in
            firstButtonVisibility = visibility
        }
        viewModel.thirdBtnVisibilityCallback = { visibility in
            thirdButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        viewModel.onFirstButtonClick()
        viewModel.onFirstButtonClick()
        viewModel.onFirstButtonClick()
        viewModel.onFirstButtonClick()
        viewModel.onThirdButtonClick()
        viewModel.onThirdButtonClick()
        viewModel.onThirdButtonClick()
        viewModel.onThirdButtonClick()
        
        XCTAssertFalse(firstButtonVisibility)
        XCTAssertFalse(thirdButtonVisibility)
    }
    
    func testFirstCardDoesNotOpenTwice() {
        var firstButtonVisibility: Bool!
        viewModel.firstBtnVisibilityCallback = { visibility in
            firstButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        viewModel.onFirstButtonClick()
        
        XCTAssertNil(firstButtonVisibility)
    }
    
    func testSecondCardDoesNotOpenTwice() {
        var secondButtonVisibility: Bool!
        viewModel.secondBtnVisibilityCallback = { visibility in
            secondButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onSecondButtonClick()
        viewModel.onSecondButtonClick()
        
        XCTAssertNil(secondButtonVisibility)
    }
    
    func testThirdCardDoesNotOpenTwice() {
        var thirdButtonVisibility: Bool!
        viewModel.thirdBtnVisibilityCallback = { visibility in
            thirdButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onThirdButtonClick()
        viewModel.onThirdButtonClick()
        
        XCTAssertNil(thirdButtonVisibility)
    }
    
    func testFourthCardDoesNotOpenTwice() {
        var fourthButtonVisibility: Bool!
        viewModel.fourthBtnVisibilityCallback = { visibility in
            fourthButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onFourthButtonClick()
        viewModel.onFourthButtonClick()
        
        XCTAssertNil(fourthButtonVisibility)
    }
    
    func testAllCardsDissapeared() {
        var firstButtonVisibility: Bool!
        var secondButtonVisibility: Bool!
        var thirdButtonVisibility: Bool!
        var fourthButtonVisibility: Bool!
        viewModel.firstBtnVisibilityCallback = { visibility in
            firstButtonVisibility = visibility
        }
        viewModel.secondBtnVisibilityCallback = { visibility in
            secondButtonVisibility = visibility
        }
        viewModel.thirdBtnVisibilityCallback = { visibility in
            thirdButtonVisibility = visibility
        }
        viewModel.fourthBtnVisibilityCallback = { visibility in
            fourthButtonVisibility = visibility
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        viewModel.onThirdButtonClick()
        viewModel.onSecondButtonClick()
        viewModel.onFourthButtonClick()
        
        XCTAssertFalse(firstButtonVisibility)
        XCTAssertFalse(secondButtonVisibility)
        XCTAssertFalse(thirdButtonVisibility)
        XCTAssertFalse(fourthButtonVisibility)
    }
    
    func testCardsGoToInitialStateWhenAreNotTheSame() {
        var firstButtonTitle: String!
        var secondButtonTitle: String!
        var thirdButtonTitle: String!
        var fourthButtonTitle: String!
        viewModel.firstBtnPictureCallback = { fileName in
            firstButtonTitle = fileName
        }
        viewModel.secondBtnPictureCallback = { fileName in
            secondButtonTitle = fileName
        }
        viewModel.thirdBtnPictureCallback = { fileName in
            thirdButtonTitle = fileName
        }
        viewModel.fourthBtnPictureCallback = { fileName in
            fourthButtonTitle = fileName
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        viewModel.onSecondButtonClick()
        viewModel.onThirdButtonClick()
        viewModel.onFourthButtonClick()
        
        XCTAssertTrue(firstButtonTitle == "Backframe")
        XCTAssertTrue(secondButtonTitle == "Backframe")
        XCTAssertTrue(thirdButtonTitle == "Backframe")
        XCTAssertTrue(fourthButtonTitle == "Backframe")
    }
    
    func testDisplayWinDialogWhenGameIsOver() {
        var messageToDisplay: String!
        viewModel.dialogCallback = { messageToDisplayInDialog in
            messageToDisplay = messageToDisplayInDialog
        }
        
        viewModel.startGame()
        viewModel.onFirstButtonClick()
        viewModel.onThirdButtonClick()
        viewModel.onSecondButtonClick()
        viewModel.onFourthButtonClick()
        
        XCTAssertTrue(messageToDisplay == "You win! Congrats!")
    }
}

private class CardsRepositoryMock: CardsRepository {
    func getCardNameForRowAndCol(row: Int, col: Int) -> String {
        if ((row == 0 && col == 0) || (row == 1 && col == 0)) {
            return "First"
        } else {
            return "Second"
        }
    }
}

private class DelayProviderMock: DelayProvider {
    func runFunctionWithDelay(delayByMilliseconds: Int, function: @escaping () -> Void) {
        function()
    }
}
