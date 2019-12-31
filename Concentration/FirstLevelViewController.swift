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
            viewModel.firstBtnPictureCallback = { [weak self] assetsFileName in
                self?.firstBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.secondBtnPictureCallback = { [weak self] assetsFileName in
                self?.secondBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.thirdBtnPictureCallback = { [weak self] assetsFileName in
                self?.thirdBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.fourthBtnPictureCallback = { [weak self] assetsFileName in self?.fourthBtn.setBackgroundImage(UIImage(named: assetsFileName), for: UIControl.State.normal)
            }
            viewModel.firstBtnVisibilityCallback = { [weak self] visibility in
                UIView.transition(with: self!.firstBtn, duration: 1, options: .showHideTransitionViews, animations: { self!.firstBtn.alpha = 0.0 })
            }
            viewModel.secondBtnVisibilityCallback = { [weak self] visibility in
                UIView.transition(with: self!.secondBtn, duration: 1, options: .showHideTransitionViews, animations: { self!.secondBtn.alpha = 0.0 })
            }
            viewModel.thirdBtnVisibilityCallback = { [weak self] visibility in
                UIView.transition(with: self!.thirdBtn, duration: 1, options: .showHideTransitionViews, animations: { self!.thirdBtn.alpha = 0.0 })
            }
            viewModel.fourthBtnVisibilityCallback = { [weak self] visibility in
                UIView.transition(with: self!.fourthBtn, duration: 1, options: .showHideTransitionViews, animations: { self!.fourthBtn.alpha = 0.0 })
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
        viewModel = GameViewModel(cardsRepository: CardsRepositoryImpl(), delayProvider: AsyncAfterDelayProvider())
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

