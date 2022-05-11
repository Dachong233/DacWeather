//
//  UIView+DWViewHelper.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/9.
//

import Foundation
import UIKit

extension UIView {
    var origin: CGPoint {
        get { self.frame.origin }
        set {
            var rect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
    }
    
    var size: CGSize {
        get { self.frame.size }
        set {
            var rect = self.frame
            rect.size = newValue
            self.frame = rect
        }
    }
    
    var top: CGFloat {
        get { self.frame.origin.y }
        set {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    var bottom: CGFloat {
        get { self.frame.origin.y + self.frame.size.height}
        set {
            var rect = self.frame
            rect.origin.y = newValue - self.frame.size.height
            self.frame = rect
        }
    }
    
    var left: CGFloat {
        get { self.frame.origin.x }
        set {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    var right: CGFloat {
        get { self.frame.origin.x + self.frame.size.width }
        set {
            var rect = self.frame
            rect.origin.y = newValue - self.frame.size.width
            self.frame = rect
        }
    }
    
    var width: CGFloat {
        get { self.frame.size.width }
        set {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    var height: CGFloat {
        get { self.frame.size.height }
        set {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    
}
