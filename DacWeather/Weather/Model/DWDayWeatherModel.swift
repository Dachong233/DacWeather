//
//  DWDayWeatherModel.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/16.
//

/**
 逐天预报文档：https://dev.qweather.com/docs/api/weather/weather-daily-forecast/
 {
   "code": "200",
   "updateTime": "2021-11-15T16:35+08:00",
   "fxLink": "http://hfx.link/2ax1",
   "daily": [
     {
       "fxDate": "2021-11-15",
       "sunrise": "06:58",
       "sunset": "16:59",
       "moonrise": "15:16",
       "moonset": "03:40",
       "moonPhase": "盈凸月",
       "moonPhaseIcon": "803",
       "tempMax": "12",
       "tempMin": "-1",
       "iconDay": "101",
       "textDay": "多云",
       "iconNight": "150",
       "textNight": "晴",
       "wind360Day": "45",
       "windDirDay": "东北风",
       "windScaleDay": "1-2",
       "windSpeedDay": "3",
       "wind360Night": "0",
       "windDirNight": "北风",
       "windScaleNight": "1-2",
       "windSpeedNight": "3",
       "humidity": "65",
       "precip": "0.0",
       "pressure": "1020",
       "vis": "25",
       "cloud": "4",
       "uvIndex": "3"
     }]
 }
 */

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dWDayWeatherModel = try DWDayWeatherModel(json)

import Foundation

// MARK: - DWDayWeatherModel
struct DWDayWeatherModel: Codable {
    let code, updateTime: String?
    let fxLink: String?
    let daily: [DWDaily]?
    let refer: DWRefer?
}

// MARK: DWDayWeatherModel convenience initializers and mutators

extension DWDayWeatherModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWDayWeatherModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: String?? = nil,
        updateTime: String?? = nil,
        fxLink: String?? = nil,
        daily: [DWDaily]?? = nil,
        refer: DWRefer?? = nil
    ) -> DWDayWeatherModel {
        return DWDayWeatherModel(
            code: code ?? self.code,
            updateTime: updateTime ?? self.updateTime,
            fxLink: fxLink ?? self.fxLink,
            daily: daily ?? self.daily,
            refer: refer ?? self.refer
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DWDaily
struct DWDaily: Codable {
    let fxDate, sunrise, sunset, moonrise: String?
    let moonset, moonPhase, moonPhaseIcon, tempMax: String?
    let tempMin, iconDay, textDay, iconNight: String?
    let textNight, wind360Day, windDirDay, windScaleDay: String?
    let windSpeedDay, wind360Night, windDirNight, windScaleNight: String?
    let windSpeedNight, humidity, precip, pressure: String?
    let vis, cloud, uvIndex: String?
}

// MARK: DWDaily convenience initializers and mutators

extension DWDaily {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWDaily.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        fxDate: String?? = nil,
        sunrise: String?? = nil,
        sunset: String?? = nil,
        moonrise: String?? = nil,
        moonset: String?? = nil,
        moonPhase: String?? = nil,
        moonPhaseIcon: String?? = nil,
        tempMax: String?? = nil,
        tempMin: String?? = nil,
        iconDay: String?? = nil,
        textDay: String?? = nil,
        iconNight: String?? = nil,
        textNight: String?? = nil,
        wind360Day: String?? = nil,
        windDirDay: String?? = nil,
        windScaleDay: String?? = nil,
        windSpeedDay: String?? = nil,
        wind360Night: String?? = nil,
        windDirNight: String?? = nil,
        windScaleNight: String?? = nil,
        windSpeedNight: String?? = nil,
        humidity: String?? = nil,
        precip: String?? = nil,
        pressure: String?? = nil,
        vis: String?? = nil,
        cloud: String?? = nil,
        uvIndex: String?? = nil
    ) -> DWDaily {
        return DWDaily(
            fxDate: fxDate ?? self.fxDate,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset,
            moonrise: moonrise ?? self.moonrise,
            moonset: moonset ?? self.moonset,
            moonPhase: moonPhase ?? self.moonPhase,
            moonPhaseIcon: moonPhaseIcon ?? self.moonPhaseIcon,
            tempMax: tempMax ?? self.tempMax,
            tempMin: tempMin ?? self.tempMin,
            iconDay: iconDay ?? self.iconDay,
            textDay: textDay ?? self.textDay,
            iconNight: iconNight ?? self.iconNight,
            textNight: textNight ?? self.textNight,
            wind360Day: wind360Day ?? self.wind360Day,
            windDirDay: windDirDay ?? self.windDirDay,
            windScaleDay: windScaleDay ?? self.windScaleDay,
            windSpeedDay: windSpeedDay ?? self.windSpeedDay,
            wind360Night: wind360Night ?? self.wind360Night,
            windDirNight: windDirNight ?? self.windDirNight,
            windScaleNight: windScaleNight ?? self.windScaleNight,
            windSpeedNight: windSpeedNight ?? self.windSpeedNight,
            humidity: humidity ?? self.humidity,
            precip: precip ?? self.precip,
            pressure: pressure ?? self.pressure,
            vis: vis ?? self.vis,
            cloud: cloud ?? self.cloud,
            uvIndex: uvIndex ?? self.uvIndex
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
