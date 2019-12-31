//
//  GameViewModel.swift
//  Concentration
//
//  Created by Pavel Suvit on 07/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

class GameViewModel {
    private var repo: CardsRepository
    private var delayProvider: DelayProvider
    
    init(cardsRepository: CardsRepository, delayProvider: DelayProvider) {
        self.repo = cardsRepository
        self.delayProvider = delayProvider
    }
    
    var firstBtnVisibilityCallback: ((Bool) -> Void)?
    private var firstBtnVisibilityState = true {
        didSet {
            firstBtnVisibilityCallback?(firstBtnVisibilityState)
        }
    }
    var secondBtnVisibilityCallback: ((Bool) -> Void)?
    private var secondBtnVisibilityState = true {
        didSet {
            secondBtnVisibilityCallback?(secondBtnVisibilityState)
        }
    }
    var thirdBtnVisibilityCallback: ((Bool) -> Void)?
    private var thirdBtnVisibilityState = true {
        didSet {
            thirdBtnVisibilityCallback?(thirdBtnVisibilityState)
        }
    }
    var fourthBtnVisibilityCallback: ((Bool) -> Void)?
    private var fourthBtnVisibilityState = true {
        didSet {
            fourthBtnVisibilityCallback?(fourthBtnVisibilityState)
        }
    }
    var firstBtnPictureCallback: ((String) -> Void)?
    private var firstBtnPicture = "" {
        didSet {
            firstBtnPictureCallback?(firstBtnPicture)
        }
    }
    var secondBtnPictureCallback: ((String) -> Void)?
    private var secondBtnPicture = "" {
        didSet {
            secondBtnPictureCallback?(secondBtnPicture)
        }
    }
    var thirdBtnPictureCallback: ((String) -> Void)?
    private var thirdBtnPicture = "" {
        didSet {
            thirdBtnPictureCallback?(thirdBtnPicture)
        }
    }
    var fourthBtnPictureCallback: ((String) -> Void)?
    private var fourthBtnPicture = "" {
        didSet {
            fourthBtnPictureCallback?(fourthBtnPicture)
        }
    }
    
    var dialogCallback: ((String) -> Void)?
    
    private var openCardsCount = 0
    private var imageOfOpenCard = ""
    private var openCardRow: Int!
    private var openCardCol: Int!
    
    func startGame() {
        firstBtnPicture = "Backframe"
        secondBtnPicture = "Backframe"
        thirdBtnPicture = "Backframe"
        fourthBtnPicture = "Backframe"
    }
    
    func onFirstButtonClick() {
        openCardsCount += 1
        let imageOfCard = repo.getCardNameForRowAndCol(row: 0, col: 0)
        firstBtnPicture = imageOfCard
        if (openCardsCount == 2) {
            if (openCardRow == 0 && openCardCol == 0) {
                openCardsCount -= 1
                return
            }
            if (repo.getCardNameForRowAndCol(row: openCardRow, col: openCardCol) == imageOfCard) {
                hideCard(row: openCardRow, col: openCardCol)
                firstBtnVisibilityState  = false
                checkWinConditionsAndDisplayDialogIfGameIsOver()
            } else {
                setImageForCardWithAnimation(row: openCardRow, col: openCardCol, picture: "Backframe")
                delayProvider.runFunctionWithDelay(delayByMilliseconds: 700, function: { [weak self] in
                    self?.firstBtnPicture = "Backframe"
                })
            }
            openCardsCount = 0
        } else {
            openCardRow = 0
            openCardCol = 0
        }
    }
    
    func onSecondButtonClick() {
        openCardsCount += 1
        let imageOfCard = repo.getCardNameForRowAndCol(row: 0, col: 1)
        secondBtnPicture = imageOfCard
        if (openCardsCount == 2) {
            if (openCardRow == 0 && openCardCol == 1) {
                openCardsCount -= 1
                return
            }
            if (repo.getCardNameForRowAndCol(row: openCardRow, col: openCardCol) == imageOfCard) {
                hideCard(row: openCardRow, col: openCardCol)
                secondBtnVisibilityState  = false
                checkWinConditionsAndDisplayDialogIfGameIsOver()
            } else {
                setImageForCardWithAnimation(row: openCardRow, col: openCardCol, picture: "Backframe")
                delayProvider.runFunctionWithDelay(delayByMilliseconds: 700, function: { [weak self] in
                    self?.secondBtnPicture = "Backframe"
                })
            }
            openCardsCount = 0
        } else {
           openCardRow = 0
           openCardCol = 1
        }
    }
    
    func onThirdButtonClick() {
        openCardsCount += 1
        let imageOfCard = repo.getCardNameForRowAndCol(row: 1, col: 0)
        thirdBtnPicture = imageOfCard
        if (openCardsCount == 2) {
            if (openCardRow == 1 && openCardCol == 0) {
                openCardsCount -= 1
                return
            }
            if (repo.getCardNameForRowAndCol(row: openCardRow, col: openCardCol) == imageOfCard) {
                hideCard(row: openCardRow, col: openCardCol)
                thirdBtnVisibilityState  = false
                checkWinConditionsAndDisplayDialogIfGameIsOver()
            } else {
                setImageForCardWithAnimation(row: openCardRow, col: openCardCol, picture: "Backframe")
                delayProvider.runFunctionWithDelay(delayByMilliseconds: 700, function: { [weak self] in
                    self?.thirdBtnPicture = "Backframe"
                })
            }
            openCardsCount = 0
        } else {
            openCardRow = 1
            openCardCol = 0
        }
    }
    
    func onFourthButtonClick() {
        openCardsCount += 1
        let imageOfCard = repo.getCardNameForRowAndCol(row: 1, col: 1)
        fourthBtnPicture = imageOfCard
        if (openCardsCount == 2) {
            if (openCardRow == 1 && openCardCol == 1) {
                openCardsCount -= 1
                return
            }
            if (repo.getCardNameForRowAndCol(row: openCardRow, col: openCardCol) == imageOfCard) {
                hideCard(row: openCardRow, col: openCardCol)
                fourthBtnVisibilityState  = false
                checkWinConditionsAndDisplayDialogIfGameIsOver()
            } else {
                setImageForCardWithAnimation(row: openCardRow, col: openCardCol, picture: "Backframe")
                delayProvider.runFunctionWithDelay(delayByMilliseconds: 700, function: { [weak self] in
                    self?.fourthBtnPicture = "Backframe"
                })
            }
            openCardsCount = 0
        } else {
            openCardRow = 1
            openCardCol = 1
        }
    }
    
    private func hideCard(row: Int, col: Int) {
        if (row == 0 && col == 0) {
            firstBtnVisibilityState = false
        } else if (row == 0 && col == 1) {
            secondBtnVisibilityState = false
        } else if (row == 1 && col == 0) {
            thirdBtnVisibilityState = false
        } else if (row == 1 && col == 1) {
            fourthBtnVisibilityState = false
        }
    }
    
    private func setImageForCardWithAnimation(row: Int, col: Int, picture: String) {
        delayProvider.runFunctionWithDelay(delayByMilliseconds: 700, function: { [weak self] in
            if (row == 0 && col == 0) {
                self?.firstBtnPicture = picture
            } else if (row == 0 && col == 1) {
                self?.secondBtnPicture = picture
            } else if (row == 1 && col == 0) {
                self?.thirdBtnPicture = picture
            } else if (row == 1 && col == 1) {
                self?.fourthBtnPicture = picture
            }
        })
    }
    
    private func checkWinConditionsAndDisplayDialogIfGameIsOver() {
        if (!firstBtnVisibilityState && !secondBtnVisibilityState && !thirdBtnVisibilityState && !fourthBtnVisibilityState) {
            dialogCallback?("You win! Congrats!")
        }
    }
}
