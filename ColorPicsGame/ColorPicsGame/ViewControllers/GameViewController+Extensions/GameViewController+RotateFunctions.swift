//
//  GameViewController+RotateFunctions.swift
//  ColorPicsGame
//
//  Created by Rost on 11/28/18.
//  Copyright © 2018 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension GameViewController {
    
    func rotateByY() {
        UIView.animate(withDuration: TimeInterval(animationTime)) {
            self.containerView.layer.transform = CATransform3DConcat(self.containerView.layer.transform, CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0))
        }
    }
    
    func rotateByX(_ isLeft: Bool) {
        var rotationTransform = CATransform3DIdentity
        
        var angle = CGFloat(Double.pi)
        
        if isLeft {
            angle = CGFloat(-Double.pi)
        }

        rotationTransform = CATransform3DConcat(self.containerView.layer.transform, CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0))
        
        UIView.animate(withDuration: TimeInterval(animationTime)) {
            self.containerView.layer.transform = rotationTransform
        }
    }
}
