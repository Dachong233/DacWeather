//
//  UIColorExtension.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/11.
//

import Foundation
import UIKit

extension UIColor {
    
    static func dw_color(_ hex: UInt32, alpha: CGFloat) -> UIColor {
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16)
        let green: CGFloat = CGFloat((hex & 0xFF00) >> 8)
        let blue: CGFloat = CGFloat(hex & 0xFF)
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    
    static func dw_color(_ hex: UInt32) -> UIColor {
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16)
        let green: CGFloat = CGFloat((hex & 0xFF00) >> 8)
        let blue: CGFloat = CGFloat(hex & 0xFF)
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
    
    static func dw_rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    static func dw_dynamicColor(light: UIColor = UIColor.white, dark: UIColor = UIColor.black) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { UITraitCollection in
                if UITraitCollection.userInterfaceStyle == .light {
                    return light
                }
                return dark
            }
        } else {
            return light
        }
    }
    
}
