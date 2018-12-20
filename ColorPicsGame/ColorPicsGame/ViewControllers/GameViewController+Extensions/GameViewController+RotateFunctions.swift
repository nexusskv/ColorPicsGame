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
        
        /* Реальный еффект ротации
         
         CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
         rotationAndPerspectiveTransform.m34 = 1.0 / -1000.0;
         rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI * 0.6, 1.0f, 0.0f, 0.0f);
         [UIView animateWithDuration:1.0 animations:^{
         self.someView.layer.anchorPoint = CGPointMake(0.5, 0);
         self.someView.layer.transform = rotationAndPerspectiveTransform;
         } completion:^(BOOL finished){
         // code to be executed when flip is completed
         }];
         */
        
        /*  Переворот вьюхи в 2D
         let groupAnimation = CAAnimationGroup()
         groupAnimation.beginTime = CACurrentMediaTime() + 0.5
         groupAnimation.duration = 0.8
         
         let rotate = CABasicAnimation(keyPath: "transform.rotation")
         rotate.fromValue = angle
         rotate.toValue = 0.0
         
         groupAnimation.animations = [rotate]
         self.containerView.layer.add(groupAnimation, forKey: nil)
         */
        /*
         UIView.transition(with: self.containerView, duration: 1.0, options: .transitionFlipFromLeft, animations: {
         self.containerView.layer.transform = CATransform3DConcat(self.containerView.layer.transform, CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0))
         }, completion: nil)
         */
        //DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        //    UIView.animate(withDuration: TimeInterval(animationTime)) {
        /*
         let transformAnim            = CAKeyframeAnimation(keyPath: "transform")
         transformAnim.values         = [NSValue(caTransform3D: CATransform3DConcat(self.containerView.layer.transform, CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0)))]
         transformAnim.keyTimes       = [1, 0]
         transformAnim.duration       = 1
         
         self.containerView.layer.add(transformAnim, forKey: "transform")*/
        
        /*
         let theAnimation = CABasicAnimation(keyPath: "transform");
         theAnimation.fromValue = [NSValue(CGPoint: CGPointMake(screenWidth/2, self.animationButton.frame.origin.y))]
         theAnimation.toValue = [NSValue(cgPoint: CGPoint(x: 100.0, y: 100.0))]
         theAnimation.duration = 3.0;
         theAnimation.autoreverses = false //true - возвращает в исходное значение либо плавно, либо нет
         theAnimation.repeatCount = 2
         self.containerView.layer.addAnimation(theAnimation, forKey: "transform");
         */
        
        //self.containerView.layer.transform = CATransform3DConcat(self.containerView.layer.transform, CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0))
        //}
        // }
        
        /*  // Перевернуть на 90 градусов вправо по свайпу влево
         UIView.animate(withDuration: 2) {
         self.containerView.transform = CGAffineTransform(rotationAngle: .pi / 2)
         }
         self.containerView.transform = CGAffineTransform.identity
         */
    }
}
