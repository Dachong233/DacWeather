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
import Dispatch

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
    /// 文本标签：当前
    private var textLabel_now: DWLabel?
    
    private var splitLine: UIView?
    
    /// 数据标签：温度
    private var dataLabel_temp: UILabel?
    /// 数据标签：体感温度
    private var dataLabel_feelsLike: UILabel?
    /// 数据标签：当前天气
    private var dataLabel_weather: UILabel?
    /// 数据标签：风向
    private var dataLabel_windDirection: UILabel?
    /// 数据标签：风力等级
    private var dataLabel_windScale: UILabel?
    
    private var nowWeather: DWNowWeatherModel? {
        didSet {
            DispatchQueue.main.async {
                self.reloadWeatherData()
            }
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
        cornerRectView = UIView(frame: self.frame)
        cornerRectView?.layer.cornerRadius = 8
        cornerRectView?.layer.masksToBounds = true
        cornerRectView?.backgroundColor = DWColorHelper.Theme.themeBlue
        self.addSubview(cornerRectView!)
        // 天气图标
        let icon = UIImage(named: "100.png")
        weatherIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        weatherIcon?.image = icon
        self.addSubview(weatherIcon!)
        // 分割线
        splitLine = UIView(frame: CGRect.zero)
        splitLine?.backgroundColor = UIColor.lightGray
        self.addSubview(splitLine!)
        // 温度
        dataLabel_temp = UILabel(frame: CGRect.zero)
        dataLabel_temp?.text = "获取中..."
        dataLabel_temp?.font = UIFont.systemFont(ofSize: 36)
        dataLabel_temp?.textColor = UIColor.darkGray
        dataLabel_temp?.sizeToFit()
        self.addSubview(dataLabel_temp!)
        // 当前
        textLabel_now = DWLabel(frame: CGRect.zero)
        textLabel_now?.text = "当前"
        textLabel_now?.textColor = UIColor.white
        textLabel_now?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        textLabel_now?.backgroundColor = DWColorHelper.Theme.themeOrange
        textLabel_now?.sizeToFit()
        textLabel_now?.layer.cornerRadius = 4
        textLabel_now?.layer.masksToBounds = true
        self.addSubview(textLabel_now!)
        // 天气
        dataLabel_weather = UILabel(frame: CGRect.zero)
        dataLabel_weather?.text = "晴"
        dataLabel_weather?.font = UIFont.systemFont(ofSize: 24)
        dataLabel_weather?.textColor = UIColor.darkGray
        dataLabel_weather?.sizeToFit()
        self.addSubview(dataLabel_weather!)
        // 体感温度
        textLabel_feelsLike = UILabel(frame: CGRect.zero)
        textLabel_feelsLike?.text = "体感温度"
        textLabel_feelsLike?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        textLabel_feelsLike?.textColor = UIColor.darkGray
        textLabel_feelsLike?.sizeToFit()
        self.addSubview(textLabel_feelsLike!)
        
        dataLabel_feelsLike = UILabel(frame: CGRect.zero)
        dataLabel_feelsLike?.text = "获取中"
        dataLabel_feelsLike?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        dataLabel_feelsLike?.textColor = UIColor.darkGray
        dataLabel_feelsLike?.sizeToFit()
        self.addSubview(dataLabel_feelsLike!)
        // 风向
        textLabel_windDirection = UILabel(frame: CGRect.zero)
        textLabel_windDirection?.text = "风向"
        textLabel_windDirection?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        textLabel_windDirection?.textColor = UIColor.darkGray
        textLabel_windDirection?.sizeToFit()
        self.addSubview(textLabel_windDirection!)
        
        dataLabel_windDirection = UILabel(frame: CGRect.zero)
        dataLabel_windDirection?.text = "获取中"
        dataLabel_windDirection?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        dataLabel_windDirection?.textColor = UIColor.darkGray
        dataLabel_windDirection?.sizeToFit()
        self.addSubview(dataLabel_windDirection!)
        // 风力等级
        textLabel_windScale = UILabel(frame: CGRect.zero)
        textLabel_windScale?.text = "风力等级"
        textLabel_windScale?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        textLabel_windScale?.textColor = UIColor.darkGray
        textLabel_windScale?.sizeToFit()
        self.addSubview(textLabel_windScale!)
        
        dataLabel_windScale = UILabel(frame: CGRect.zero)
        dataLabel_windScale?.text = "获取中"
        dataLabel_windScale?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        dataLabel_windScale?.textColor = UIColor.darkGray
        dataLabel_windScale?.sizeToFit()
        self.addSubview(dataLabel_windScale!)
        // 建立约束
        setupConstraints()
    }
    
    private func setupConstraints() {
        // 圆角矩形
        cornerRectView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        // 天气图标
        weatherIcon?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        })
        // 天气
        dataLabel_weather?.snp.makeConstraints({ make in
            make.centerX.equalTo(weatherIcon!)
            //make.bottom.equalTo(textLabel_windDirection!.snp.bottom)
            make.top.equalTo(weatherIcon!.snp.bottom).offset(10).priority(.required)
            make.bottom.equalTo(textLabel_windDirection!.snp.bottom).priority(.medium)
        })
        // 分割线
        splitLine?.snp.makeConstraints({ make in
            make.left.equalTo(weatherIcon!.snp.right).offset(15)
            make.top.equalTo(dataLabel_temp!)
            make.bottom.equalTo(textLabel_windDirection!.snp.bottom)
            make.width.equalTo(1)
        })
        // 温度
        dataLabel_temp?.snp.makeConstraints({ make in
            make.left.equalTo(splitLine!.snp.right).offset(20)
            make.top.equalToSuperview().offset(20)
        })
        // 当前标签
        textLabel_now?.snp.makeConstraints({ make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(dataLabel_temp!.snp.lastBaseline)
        })
        // 体感温度
        textLabel_feelsLike?.snp.makeConstraints({ make in
            make.left.equalTo(dataLabel_temp!)
            make.top.equalTo(dataLabel_temp!.snp.bottom).offset(15)
        })
        dataLabel_feelsLike?.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(textLabel_feelsLike!)
        }
        // 风力等级
        textLabel_windScale?.snp.makeConstraints({ make in
            make.left.equalTo(textLabel_feelsLike!)
            make.top.equalTo(textLabel_feelsLike!.snp.bottom).offset(10)
        })
        dataLabel_windScale?.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(textLabel_windScale!)
        }
        // 风向
        textLabel_windDirection?.snp.makeConstraints({ make in
            make.left.equalTo(textLabel_windScale!)
            make.top.equalTo(textLabel_windScale!.snp.bottom).offset(10)
        })
        dataLabel_windDirection?.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(textLabel_windDirection!)
        }
        
    }
    
    // MARK: data
    
    public func setNowWeatherData(_ nowWeatherData: DWNowWeatherModel) {
        self.nowWeather = nowWeatherData
    }
    
    private func reloadWeatherData() {
        if nowWeather != nil, let now = nowWeather!.now {
            weatherIcon?.image = UIImage(named: (now.icon ?? "100") + ".png")
            dataLabel_temp?.text = (now.temp ?? "未知") + "°C"
            dataLabel_temp?.sizeToFit()
            dataLabel_weather?.text = now.text ?? "未知"
            dataLabel_weather?.sizeToFit()
            dataLabel_feelsLike?.text = (now.feelsLike ?? "未知") + "°C"
            dataLabel_feelsLike?.sizeToFit()
            dataLabel_windDirection?.text = now.windDir ?? "未知"
            dataLabel_windDirection?.sizeToFit()
            dataLabel_windScale?.text = now.windScale ?? "未知"
            dataLabel_windScale?.sizeToFit()
        }
        
    }
    
}
