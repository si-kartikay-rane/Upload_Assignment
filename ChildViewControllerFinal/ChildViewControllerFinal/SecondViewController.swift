//
//  SecondViewController.swift
//  ChildViewController
//
//  Created by Kartikay Rane on 03/11/23.
//

import Foundation
import UIKit


class SecondViewController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func didTapOnRemove(_ sender: Any) {
        if let parent = self.parent {
                willMove(toParent: nil)
                view.removeFromSuperview()
                removeFromParent()
            }
    }
    
}
