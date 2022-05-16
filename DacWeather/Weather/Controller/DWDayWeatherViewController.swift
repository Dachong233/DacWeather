//
//  DWDayWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/9.
//

import UIKit

class DWDayWeatherViewController: UIViewController {
    private var dayWeatherView: DWDayWeatherView?
    public var frame: CGRect = CGRect.zero
    
    override func loadView() {
        dayWeatherView = DWDayWeatherView(frame: frame)
        self.view = dayWeatherView!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: Data
    public func setDayWeatherData(_ dayWeatherData: DWDayWeatherModel) {
        dayWeatherView?.setDayWeatherData(dayWeatherData)
    }

}
