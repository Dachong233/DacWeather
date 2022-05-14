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
        // Do any additional setup after loading the view.
        DWWeatherApiClient.sharedInstance.getNowWeather(location: "101010100") { nowWeatherModel in
            self.nowWeatherViewController?.setNowWeatherData(nowWeatherModel)
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
        nowWeatherViewController?.didMove(toParent: self)
        
        // 小时天气
        
        // 星期天气
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        cityLable?.snp.makeConstraints({ make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        })
        nowWeatherViewController!.view.snp.makeConstraints({ make in
            make.top.equalTo(cityLable!.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(180)
        })
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
