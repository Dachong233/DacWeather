//
//  DWDayWeatherCell.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/16.
//

import UIKit
import SnapKit

class DWDayWeatherCell: UICollectionViewCell {
    /// 预报日期
    private var dataLabel_fxDate: UILabel?
    /// 当日最高/最低温度
    private var dataLabel_temp: UILabel?
    
    /// ViewGroup
    private var viewGroup: UIView?
    /// 当日白天天气图标
    private var weatherIcon: UIImageView?
    /// 当日白天天气文本
    private var dataLabel_weatherText: UILabel?
    
    private var maxTemperature: String = "未知°C"
    private var minTemperature: String = "未知°C"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    
    private func initUI() {
        // 预报日期
        dataLabel_fxDate = UILabel(frame: CGRect.zero)
        dataLabel_fxDate?.text = "获取中"
        dataLabel_fxDate?.textColor = UIColor.darkGray
        dataLabel_fxDate?.font = UIFont.systemFont(ofSize: DWFontHelper.smallSize)
        dataLabel_fxDate?.sizeToFit()
        self.addSubview(dataLabel_fxDate!)
        // 天气viewGroup
        viewGroup = UIView(frame: .zero)
        self.addSubview(viewGroup!)
        // 天气图标
        weatherIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        weatherIcon?.image = UIImage(named: "100.png")
        self.viewGroup!.addSubview(weatherIcon!)
        // 天气文本
        dataLabel_weatherText = UILabel(frame: CGRect.zero)
        dataLabel_weatherText?.text = "晴"
        dataLabel_weatherText?.textColor = UIColor.darkGray
        dataLabel_weatherText?.font = UIFont.systemFont(ofSize: DWFontHelper.smallSize)
        dataLabel_weatherText?.sizeToFit()
        self.viewGroup!.addSubview(dataLabel_weatherText!)
        // 当日最高/最低温度
        dataLabel_temp = UILabel(frame: CGRect.zero)
        dataLabel_temp?.text = "未知°C/未知°C"
        dataLabel_temp?.textColor = UIColor.darkGray
        dataLabel_temp?.font = UIFont.systemFont(ofSize: DWFontHelper.smallSize)
        dataLabel_temp?.sizeToFit()
        self.addSubview(dataLabel_temp!)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        // 预报日期
        dataLabel_fxDate?.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        })
        // 天气viewGroup
        viewGroup?.snp.makeConstraints({ make in
            make.height.equalTo(self.dw_height)
            make.width.equalTo(weatherIcon!.dw_width + dataLabel_weatherText!.dw_width)
            make.centerX.centerY.equalToSuperview()
        })
        // 天气图标、天气文本
        weatherIcon?.snp.makeConstraints({ make in
            make.left.centerY.equalToSuperview()
            make.size.equalTo(24).priority(.required)
        })
        dataLabel_weatherText?.snp.makeConstraints({ make in
            make.centerY.equalTo(weatherIcon!)
            make.left.equalTo(weatherIcon!.snp.right).offset(10)
        })
        // 当日最低/最高温度
        dataLabel_temp?.snp.makeConstraints({ make in
            make.centerY.equalTo(dataLabel_weatherText!)
            make.right.equalToSuperview().inset(10)
        })
    }
    
    // MARK: Data
    public func setFxDate(_ date: String) {
        dataLabel_fxDate?.text = date
    }
    
    public func setWeatherIcon(_ icon: UIImage?) {
        weatherIcon?.image = icon
    }
    
    public func setWeatherText(_ text: String) {
        dataLabel_weatherText?.text = text
    }
    
    public func setMaxTemperature(_ maxTemperature: String) {
        self.maxTemperature = maxTemperature
        refreshAttributedText()
    }
    
    public func setMinTemperature(_ minTemperature: String) {
        self.minTemperature = minTemperature
        refreshAttributedText()
    }
    
    private func refreshAttributedText() {
        let text = self.minTemperature + "/" + self.maxTemperature
        let attributedTemp: NSMutableAttributedString = NSMutableAttributedString(string: text)
        let attributedMinTempDict: [NSAttributedString.Key: Any] = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.systemGray
        ]
        let attributedMaxTempDict: [NSAttributedString.Key: Any] = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        let attributedDashDict: [NSAttributedString.Key: Any] = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        
        let minRange = NSRange(location: 0, length: self.minTemperature.count)
        let maxRange = NSRange(location: self.minTemperature.count, length: self.maxTemperature.count)
        let dashRange = NSRange(location: self.minTemperature.count, length: 1)
        
        attributedTemp.addAttributes(attributedMinTempDict, range: minRange)
        attributedTemp.addAttributes(attributedMaxTempDict, range: maxRange)
        attributedTemp.addAttributes(attributedDashDict, range: dashRange)
        dataLabel_temp?.attributedText = attributedTemp
    }
}
