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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewControllerForFirstLevel = storyBoard.instantiateViewController(withIdentifier: "FirstLevelViewController")
        navigationController?.pushViewController(viewControllerForFirstLevel, animated: true)
    }
}
