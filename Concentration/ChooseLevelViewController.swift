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
    
    @IBAction func firstLevelClick(_ sender: Any) {
        goToTheScreenWithName(identifierForViewController: "FirstLevelViewController")
    }
    @IBAction func secondLevelClick(_ sender: Any) {
        goToTheScreenWithName(identifierForViewController: "SecondLevelViewController")
    }
    
    private func goToTheScreenWithName(identifierForViewController: String) {
        let storyBoards = UIStoryboard(name: "Main", bundle: nil)
        let viewControllerForSecondLevel = storyBoards.instantiateViewController(withIdentifier: identifierForViewController)
        navigationController?.pushViewController(viewControllerForSecondLevel, animated: true)
    }
}
