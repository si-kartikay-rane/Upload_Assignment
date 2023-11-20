
//  ViewController.swift
//  ChildViewController
//
//  Created by Kartikay Rane on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOnAdd(_ sender: Any) {
        let newSecondVC = SecondViewController()
            addChild(newSecondVC)
            view.addSubview(newSecondVC.view)
            newSecondVC.didMove(toParent: self)

    }
    
}


