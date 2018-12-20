//
//  GameViewController+Gestures.swift
//  ColorPicsGame
//
//  Created by Rost on 11/28/18.
//  Copyright © 2018 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension GameViewController {
    
    func addSwipeGestures() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let pinchScale = UIPinchGestureRecognizer(target: self, action: #selector(self.handleScale))
        self.view.addGestureRecognizer(pinchScale)
        
        let panDrag = UIPanGestureRecognizer(target: self, action: #selector(self.handleDrag))
        containerView.addGestureRecognizer(panDrag)
    }
}

