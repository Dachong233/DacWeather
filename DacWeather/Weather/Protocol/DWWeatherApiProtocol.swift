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
    func getNowWeather(location: String, succ: ((DWNowWeatherModel)->Void)?, fail: ((String)->Void)?)
    
    /**
     小时天气
     */
    func getHourWeather(location: String, succ: ((DWHourWeatherModel)->Void)?, fail: ((String)->Void)?)
    
    /**
     逐天天气
     */
    func getDayWeather(location: String, succ: ((DWDayWeatherModel)->Void)?, fail: ((String)->Void)?)
}
