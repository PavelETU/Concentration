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
        viewModel = GameViewModel()
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
}
