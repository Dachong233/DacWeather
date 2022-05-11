//
//  DWNowWeatherView.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/10.
//

import UIKit
import SnapKit
import SwiftSVG
import SVGKit
import WebKit

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
    
    public var nowWeather: DWNowWeatherModel? {
        didSet {
            self.reloadWeatherData()
        }
    }
    
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
        cornerRectView?.backgroundColor = DWColorHelper.Theme.cardBgColor
        self.addSubview(cornerRectView!)
        
        let icon = UIImage(named: "100.png")
        weatherIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        weatherIcon?.image = icon
        self.addSubview(weatherIcon!)
        
    }
    
    override func layoutSubviews() {
        self.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        cornerRectView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
    }
    
    private func reloadWeatherData() {
        if nowWeather != nil, let now = nowWeather!.now {
            dataLabel_temp?.text = now.temp
        }
        
    }
    
    private func loadWeatherIcon() {
//        guard let path = Bundle.main.path(forResource: "1035", ofType: "svg") ,
//        let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
//        let document = Document(data: data) else { return }
    }
    
}
