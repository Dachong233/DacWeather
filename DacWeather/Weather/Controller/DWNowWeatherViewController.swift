//
//  DWNowWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/9.
//

import UIKit

class DWNowWeatherViewController: UIViewController {
    public var frame: CGRect = CGRect.zero
    private var nowWeatherView: DWNowWeatherView?
    
    override func loadView() {
        nowWeatherView = DWNowWeatherView(frame: self.frame)
        self.view = nowWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: Data
    public func setNowWeatherData(_ nowWeatherData: DWNowWeatherModel) {
        nowWeatherView?.setNowWeatherData(nowWeatherData)
    }
    
}
