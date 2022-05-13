//
//  DWNowWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/9.
//

import UIKit

class DWNowWeatherViewController: UIViewController {
    private var nowWeatherView: DWNowWeatherView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    

    // MARK: UI
    private func initUI() {
        nowWeatherView = DWNowWeatherView(frame: self.view.frame)
        self.view.addSubview(nowWeatherView!)
        
    }
    
    // MARK: Data
    public func setNowWeatherData(_ nowWeatherData: DWNowWeatherModel) {
        nowWeatherView?.setNowWeatherData(nowWeatherData)
    }
    
    
        

}
