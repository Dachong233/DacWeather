//
//  DWWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/8.
//

import UIKit

class DWWeatherViewController: UIViewController {
    var cityLable: UILabel?
    var nowWeatherViewController: DWNowWeatherViewController?
    var hourWeatherViewController: DWHourWeatherViewController?
    var dayWeatherViewController: DWDayWeatherViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: UI
    private func initUI() {
        cityLable = UILabel()
        cityLable?.text = "广州"
        cityLable?.font = UIFont(name: "Helvetica-Bold", size: 36)
        cityLable?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.view.addSubview(cityLable!)

    }
    
    // MARK: Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
}
