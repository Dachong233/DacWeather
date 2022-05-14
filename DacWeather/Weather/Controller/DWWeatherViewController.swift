//
//  DWWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/8.
//

import UIKit
import SnapKit

class DWWeatherViewController: UIViewController {
    private var cityLable: UILabel?
    private var nowWeatherViewController: DWNowWeatherViewController?
    private var hourWeatherViewController: DWHourWeatherViewController?
    private var dayWeatherViewController: DWDayWeatherViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        let location = "101280101"
        // Do any additional setup after loading the view.
        DWWeatherApiClient.sharedInstance.getNowWeather(location: location) { nowWeatherModel in
            self.nowWeatherViewController?.setNowWeatherData(nowWeatherModel)
        } fail: { text in
            print("error: \(text)")
        }
        
        DWWeatherApiClient.sharedInstance.getHourWeather(location: location) { hourWeatherModel in
            self.hourWeatherViewController?.setHourWeatherData(hourWeatherModel)
        } fail: { text in
            print("error: \(text)")
        }


    }
    
    
    // MARK: UI
    private func initUI() {
        self.view.backgroundColor = DWColorHelper.Theme.bgColor
        
        // 城市标签
        cityLable = UILabel()
        cityLable?.text = "广州"
        cityLable?.font = UIFont.boldSystemFont(ofSize: DWWeatherViewController.Size.cityLabelFontSize)
        cityLable?.frame = CGRect.zero
        cityLable?.sizeToFit()
        self.view.addSubview(cityLable!)
        
        // 实时天气
        nowWeatherViewController = DWNowWeatherViewController()
        self.addChild(nowWeatherViewController!)
        self.view.addSubview(nowWeatherViewController!.view)
        nowWeatherViewController!.didMove(toParent: self)
        
        // 小时天气
        hourWeatherViewController = DWHourWeatherViewController()
        self.addChild(hourWeatherViewController!)
        self.view.addSubview(hourWeatherViewController!.view)
        nowWeatherViewController!.didMove(toParent: self)
        
        // 星期天气
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        // 城市标签
        cityLable?.snp.makeConstraints({ make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        })
        // 实时天气
        nowWeatherViewController!.view.snp.makeConstraints({ make in
            make.top.equalTo(cityLable!.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(180)
        })
        // 小时天气
        hourWeatherViewController!.view.snp.makeConstraints { make in
            make.top.equalTo(nowWeatherViewController!.view.snp.bottom).offset(20)
            make.left.right.equalTo(nowWeatherViewController!.view)
            make.height.equalTo(170)
        }
    }
    
    // MARK: Life Cycle
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    
    
}

extension DWWeatherViewController {
    struct Size {
        static let cityLabelFontSize: CGFloat = 36
    }
    
}
