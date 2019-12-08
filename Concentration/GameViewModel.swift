//
//  GameViewModel.swift
//  Concentration
//
//  Created by Pavel Suvit on 07/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

class GameViewModel {
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
    func startGame() {
        firstBtnPicture = "Backframe"
        secondBtnPicture = "Backframe"
        thirdBtnPicture = "Backframe"
        fourthBtnPicture = "Backframe"
    }
}
