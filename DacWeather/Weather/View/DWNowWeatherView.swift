//
//  DWNowWeatherView.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/10.
//

import UIKit
import SnapKit

class DWNowWeatherView: UIView {
    /// 圆角矩形边框
    private var cornerRectView: UIView?
    /// 天气图标
    private var weatherIcon: UIImageView?
    /// 文本标签：体感温度
    private var textLabel_feelsLike: UILabel?
    /// 文本标签：风向
    private var textLabel_windDirection: UILabel?
    /// 文本标签：风力等级
    private var textLabel_windScale: UILabel?
    
    /// 数据标签：温度
    private var dataLabel_temp: UILabel?
    /// 数据标签：体感温度
    private var dataLabel_feelsLike: UILabel?
    /// 数据标签：当前天气
    private var dataLabel_weather: UILabel?
    /// 数据标签：风力等级
    private var dataLabel_windScale: UILabel?
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    // MARK: UI
    
    private func initUI() {
        cornerRectView = UIView(frame: CGRect(x: bounds.origin.x, y: bounds.origin.y, width: frame.width, height: frame.height))
        cornerRectView?.layer.cornerRadius = 8
        cornerRectView?.layer.masksToBounds = true
        cornerRectView?.layer.shadowColor = UIColor.black.cgColor
        cornerRectView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        cornerRectView?.layer.shadowOpacity = 0.5
        cornerRectView?.layer.shadowRadius = 8
        cornerRectView?.backgroundColor = UIColor.systemGray6
        
        self.addSubview(cornerRectView!)
        //self.backgroundColor = UIColor.systemBlue
        
    }
    
    override func layoutSubviews() {
        self.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        cornerRectView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
    
}
