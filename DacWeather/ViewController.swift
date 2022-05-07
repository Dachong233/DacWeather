//
//  ViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/3.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DWWeatherApiClient.sharedInstance.getNowWeather(location: String(101010100), succ:  { weatherModel in
            print(weatherModel)
        }, fail: { errorText in
            print(errorText)
        })
        
        struct Login: Codable {
            let code: Int
            let username, password: String
        }
        
        let params = Login.init(code: 3, username: "Dachong", password: "123456")
        
        DWNetworkService.post(url: "http://server.daccc.cn:8080/parentHelper/loginServlet", parms: params) { data in
            print(data)
        }
        
        
        
    }


}

