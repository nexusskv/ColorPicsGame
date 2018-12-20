//
//  GameViewController.swift
//  ColorPicsGame
//
//  Created by Rost on 11/23/18.
//  Copyright © 2018 Rost Gress. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var scaleIdentity = CGAffineTransform.identity

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.borderWidth     = 1
        containerView.layer.borderColor     = UIColor.lightGray.cgColor
        
        addSwipeGestures()

        DataLoader.loadData(with: { (result) in
            if let resultArray: [[Int]] = result as? [[Int]] {
                self.createNumbersBox(resultArray)
            }
        })
    }

}


