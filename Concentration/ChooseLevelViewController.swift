//
//  ChooseLevelViewController.swift
//  Concentration
//
//  Created by Pavel Suvit on 22/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import UIKit

class ChooseLevelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func firstLevelClick(_ sender: Any) {
        let storyBoards = UIStoryboard(name: "Main", bundle: nil)
        let viewControllerForSecondLevel = storyBoards.instantiateViewController(withIdentifier: "FirstLevelViewController")
        navigationController?.pushViewController(viewControllerForSecondLevel, animated: true)
    }
    
    @IBAction func secondLevelClick(_ sender: Any) {
        goToTheLevel(level: 2, color: .brown)
    }
    
    @IBAction func thirdLevelClick(_ sender: Any) {
        goToTheLevel(level: 3)
    }
    
    private func goToTheLevel(level: Int, color: UIColor = .darkGray) {
        let storyBoards = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyBoards.instantiateViewController(withIdentifier: "GeneralGameViewController") as! GeneralGameViewController
        gameViewController.level = level
        gameViewController.backgroundColor = color
        navigationController?.pushViewController(gameViewController, animated: true)
    }
}
