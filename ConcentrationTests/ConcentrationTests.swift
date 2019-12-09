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
        let expectationToWait = expectation(description: "Initial")
        viewModel.firstBtnPictureCallback = { fileName in
            if (fileName != "Backframe") {
                expectationToWait.isInverted = true
            }
            expectationToWait.fulfill()
        }
        viewModel.startGame()
        wait(for: [expectationToWait], timeout: 0.1)
    }
}
