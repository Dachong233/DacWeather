//
//  DWHourWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/9.
//

import UIKit

class DWHourWeatherViewController: UIViewController {
    private var hourWeatherView: DWHourWeatherView?
    public var frame: CGRect = CGRect.zero

    override func loadView() {
        hourWeatherView = DWHourWeatherView(frame: self.frame)
        self.view = hourWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Data
    public func setHourWeatherData(_ hourWeatherData: DWHourWeatherModel) {
        hourWeatherView?.setHourWeatherData(hourWeatherData)
    }

}
