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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstBtn.setBackgroundImage(#imageLiteral(resourceName: "Backframe"), for: UIControl.State.normal)
        secondBtn.setBackgroundImage(#imageLiteral(resourceName: "Backframe"), for: UIControl.State.normal)
        thirdBtn.setBackgroundImage(#imageLiteral(resourceName: "Backframe"), for: UIControl.State.normal)
        fourthBtn.setBackgroundImage(#imageLiteral(resourceName: "Backframe"), for: UIControl.State.normal)
    }
}

