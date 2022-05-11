//
//  DWColorHelper.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/10.
//

import Foundation
import UIKit

class DWColorHelper {
    static func dynamicColor(light: UIColor = UIColor.white, dark: UIColor = UIColor.black) -> UIColor {
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
