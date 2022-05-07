//
//  DWWeatherApiProtocol.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/5.
//

import Foundation

protocol DWWeatherApiProtocol {
    /**
     实时天气
     */
    func getNowWeather(location: String, succ: ((DWWeatherModel)->Void)?, fail: ((String)->Void)?)
}
