//
//  DWGradientView.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/15.
//

import UIKit
import SnapKit

class DWGradientView: UIView {
    var startColor, endColor: UIColor?
    var gradientLayer: CAGradientLayer?
    var leftToRight = true
    
    convenience init(frame: CGRect, startColor: UIColor, endColor: UIColor, leftToRight: Bool = true) {
        self.init(frame: frame)
        self.startColor = startColor
        self.endColor = endColor
        self.leftToRight = leftToRight
        
        gradientLayer = CAGradientLayer()
        gradientLayer!.frame = self.bounds
        gradientLayer!.colors = [startColor.cgColor, endColor.cgColor]
        if leftToRight {
            gradientLayer!.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer!.endPoint = CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer!.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer!.endPoint = CGPoint(x: 0.5, y: 1)
        }
        
        self.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
    override func layoutSubviews() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer!.frame = self.bounds
        gradientLayer!.colors = [startColor?.cgColor, startColor?.cgColor, startColor?.cgColor, startColor?.cgColor, startColor?.cgColor, endColor?.cgColor]
        if leftToRight {
            gradientLayer!.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer!.endPoint = CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer!.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer!.endPoint = CGPoint(x: 0.5, y: 1)
        }
        self.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
    
    

}
