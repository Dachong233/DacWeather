//
//  DWHourWeatherCell.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/14.
//

import UIKit
import SnapKit

class DWHourWeatherCell: UICollectionViewCell {
    private var weatherIcon: UIImageView?
    
    private var dataLabel_weather: UILabel?
    
    private var dataLabel_temp: UILabel?
    
    private var dataLabel_time: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        dataLabel_time = UILabel(frame: CGRect.zero)
        dataLabel_time?.text = "0:00"
        dataLabel_time?.textColor = UIColor.darkGray
        dataLabel_time?.font = UIFont.systemFont(ofSize: DWFontHelper.smallSize)
        self.addSubview(dataLabel_time!)
        
        weatherIcon = UIImageView(frame: CGRect.zero)
        self.addSubview(weatherIcon!)
        
        dataLabel_weather = UILabel(frame: CGRect.zero)
        dataLabel_weather?.text = "°C"
        dataLabel_weather?.textColor = UIColor.darkGray
        dataLabel_weather?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        self.addSubview(dataLabel_weather!)
        
        dataLabel_temp = UILabel(frame: CGRect.zero)
        dataLabel_temp?.text = "°C"
        dataLabel_temp?.textColor = UIColor.darkGray
        dataLabel_temp?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        self.addSubview(dataLabel_temp!)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        dataLabel_time?.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.centerX.equalTo(dataLabel_temp!)
        })
        weatherIcon?.snp.makeConstraints({ make in
            make.size.equalTo(36).priority(.required)
            make.centerX.equalTo(dataLabel_temp!)
            make.top.equalTo(dataLabel_time!.snp.bottom).offset(5)
        })
        dataLabel_weather?.snp.makeConstraints({ make in
            make.centerX.equalTo(dataLabel_temp!)
            make.top.equalTo(weatherIcon!.snp.bottom).offset(5)
        })
        dataLabel_temp?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.top.equalTo(dataLabel_weather!.snp.bottom).offset(5)
        })
    }
    
    
    public func setWeatherIcon(_ icon: UIImage?) {
        weatherIcon?.image = icon
    }
    
    public func setWeatherText(_ text: String) {
        dataLabel_weather?.text = text
    }
    
    public func setTemperature(_ temp: String) {
        dataLabel_temp?.text = temp
    }
    
    public func setTime(_ time: String) {
        dataLabel_time?.text = time
    }
    
    
}
