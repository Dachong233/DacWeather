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
    
    convenience init(frame: CGRect, startColor: UIColor, endColor: UIColor) {
        self.init(frame: frame)
        self.startColor = startColor
        self.endColor = endColor
        
        gradientLayer = CAGradientLayer()
        gradientLayer!.frame = self.bounds
        gradientLayer!.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer!.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer!.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
    override func layoutSubviews() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer!.frame = self.bounds
        gradientLayer!.colors = [startColor?.cgColor, startColor?.cgColor, startColor?.cgColor, startColor?.cgColor, startColor?.cgColor, endColor?.cgColor]
        gradientLayer!.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer!.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
    
    

}
