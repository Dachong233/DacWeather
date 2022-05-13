//
//  DWLabel.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/13.
//

import UIKit

class DWLabel: UILabel {
    private var inset: UIEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    
    public func setInset(_ inset: UIEdgeInsets) {
        self.inset = inset
    }
    
    override func draw(_ rect: CGRect) {
        super.drawText(in: rect.inset(by: inset))
    }
    
    override var intrinsicContentSize: CGSize {
            var intrinsicContentSize = super.intrinsicContentSize
            intrinsicContentSize.width += inset.left + inset.right
            intrinsicContentSize.height += inset.top + inset.bottom
            return intrinsicContentSize
        }

}
