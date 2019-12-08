//
//  ViewController.swift
//  Concentration
//
//  Created by Pavel Suvit on 07/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    
    var viewModel: GameViewModel! {
        didSet {
            viewModel.firstBtnPictureCallback = { [weak self] assetsFileName in
                self?.firstBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.secondBtnPictureCallback = { [weak self] assetsFileName in
                self?.secondBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.thirdBtnPictureCallback = { [weak self] assetsFileName in
                self?.thirdBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.fourthBtnPictureCallback = { [weak self] assetsFileName in
                self?.fourthBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GameViewModel()
        viewModel.startGame()
    }
    
    @IBAction func onFirstBtnClick(_ sender: Any) {
        viewModel.onFirstButtonClick()
    }
    
    @IBAction func onSecondBtnClick(_ sender: Any) {
        viewModel.onSecondButtonClick()
    }
    
    @IBAction func onThirdBtnClick(_ sender: Any) {
        viewModel.onThirdButtonClick()
    }
    
    @IBAction func onFourthBtnClick(_ sender: Any) {
        viewModel.onFourthButtonClick()
    }
}

