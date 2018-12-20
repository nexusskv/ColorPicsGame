//
//  GameViewController+GesturesHandlers.swift
//  ColorPicsGame
//
//  Created by Rost on 11/28/18.
//  Copyright © 2018 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension GameViewController {
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            print("Swipe Right")
            
            rotateByX(false)
        }
        else if gesture.direction == .left {
            print("Swipe Left")
            
            rotateByX(true)
        }
        else if gesture.direction == .up {
            print("Swipe Up")
            
            rotateByY()
        }
        else if gesture.direction == .down {
            print("Swipe Down")
            
            rotateByY()
        }
    }
    
    @objc func handleScale(_ gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
            case .began:
                scaleIdentity = containerView.transform
            case .changed,.ended:
                containerView.transform = scaleIdentity.scaledBy(x: gesture.scale, y: gesture.scale)
            case .cancelled:
                break
            default:
                break
        }
    }
    
    @objc func handleDrag(_ gesture: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(containerView)
        let translation = gesture.translation(in: self.view)
        containerView.center = CGPoint(x: containerView.center.x + translation.x, y: containerView.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) -> Void {
        if let tappedView = gesture.view as? TappedImageView {
            print("Tapped imageView -> ", tappedView.tag)
            
            if tappedView.isTapped {
                tappedView.isTapped = false
            } else {
                tappedView.isTapped = true
            }
            
            changeBackground(tappedView, value: tappedView.tag, tapped: tappedView.isTapped)
        }
    }
}
