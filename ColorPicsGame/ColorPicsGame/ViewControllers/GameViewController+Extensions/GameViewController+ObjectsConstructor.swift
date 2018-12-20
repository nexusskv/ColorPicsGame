//
//  GameViewController+ObjectsConstructor.swift
//  ColorPicsGame
//
//  Created by Rost on 11/28/18.
//  Copyright © 2018 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension GameViewController {
    
    func createNumbersBox(_ source: [[Int]]) {
        let containerWidth  = containerView.frame.size.width
        let rectSize        = containerWidth / CGFloat(source.count)
        let cornerRadius    = CGFloat(rectSize / 2)
        
        var yPosition: CGFloat = 0.0
        
        for nums in source {
            var xPosition: CGFloat = 0.0
            
            for num in nums {
                let boxFrame = CGRect(x: xPosition, y: yPosition, width: rectSize, height: rectSize)
                
                addImageView(boxFrame, value: num, radius: cornerRadius)
                
                xPosition += rectSize
            }
            
            yPosition += rectSize
        }
    }
    
    func addImageView(_ rect: CGRect, value: Int, radius: CGFloat) -> Void {
        let imgView = TappedImageView(frame: rect)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        imgView.addGestureRecognizer(tapGesture)
        
        changeBackground(imgView, value: value, tapped: false)
        
        addContentCustomization(imgView, value: value, radius: radius)
        
        containerView.addSubview(imgView)
    }
    
    func addContentCustomization(_ source: TappedImageView, value: Int, radius: CGFloat) {
        if value > 0 {
            let imageTitle = String.init(format:"%d_img", value)
            source.image = UIImage(named: imageTitle)
        }
        
        source.tag                      = value
        source.contentMode              = .scaleAspectFit
        source.isUserInteractionEnabled = true
        
        source.layer.borderWidth        = 0.03
        source.layer.borderColor        = UIColor.black.cgColor

        // Это решение работает с 11 iOS
        source.layer.cornerRadius = radius
        source.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func changeBackground(_ source: TappedImageView, value: Int, tapped: Bool) {
        if tapped {
            switch value {
                case 0:
                    source.backgroundColor = zeroTappedColor
                case 1:
                    source.backgroundColor = oneTappedColor
                case 2:
                    source.backgroundColor = twoTappedColor
                case 3:
                    source.backgroundColor = threeTappedColor
                case 5:
                    source.backgroundColor = fiveTappedColor
                default:
                    break
            }
        } else {
            switch value {
                case 0:
                    source.backgroundColor = zeroColor
                case 1:
                    source.backgroundColor = oneColor
                case 2:
                    source.backgroundColor = twoColor
                case 3:
                    source.backgroundColor = threeColor
                case 5:
                    source.backgroundColor = fiveColor
                default:
                    break
            }
        }
    }
}
