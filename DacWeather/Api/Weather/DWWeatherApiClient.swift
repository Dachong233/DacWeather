//
//  DWWeatherApiClient.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/5.
//

import Foundation
import Alamofire


class DWWeatherApiClient: DWWeatherApiProtocol {
    
    private static let baseUrl = "https://devapi.qweather.com/v7/weather"
    private static let key = "8c6cd8911e2a4871b0221e714ca265b4"
    static var sharedInstance: DWWeatherApiClient = {
        let instance = DWWeatherApiClient()
        return instance
    }()
    
    func getNowWeather(location: String, succ: ((DWWeatherModel) -> Void)?=nil, fail: ((String) -> Void)?=nil) {
        let params: [String: String] = [
            "key": Self.key,
            "location": location
        ]
        DWNetworkService.get(url: Self.baseUrl + "/now", parms: params) { data in
            guard let model = try? DWWeatherModel.init(data: data) else { return }
            succ?(model)
        } fail: { errorText in
            fail?(errorText)
        }
    }
    
    
    
}
