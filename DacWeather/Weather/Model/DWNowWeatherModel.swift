//
//  DWNowWeatherModel.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/6.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let DWNowWeatherModel = try DWWeatherModel(json)

/**
 返回数据文档：https://dev.qweather.com/docs/api/weather/weather-now/#%E8%BF%94%E5%9B%9E%E6%95%B0%E6%8D%AE
 */
// MARK: - DWNowWeatherModel
struct DWNowWeatherModel: Codable {
    let code, updateTime: String?
    let fxLink: String?
    let now: DWNow?
    let refer: DWRefer?
}

// MARK: DWNowWeatherModel convenience initializers and mutators

extension DWNowWeatherModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWNowWeatherModel.self, from: data)
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
        now: DWNow?? = nil,
        refer: DWRefer?? = nil
    ) -> DWNowWeatherModel {
        return DWNowWeatherModel(
            code: code ?? self.code,
            updateTime: updateTime ?? self.updateTime,
            fxLink: fxLink ?? self.fxLink,
            now: now ?? self.now,
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

// MARK: - DWNow
struct DWNow: Codable {
    let obsTime, temp, feelsLike, icon: String?
    let text, wind360, windDir, windScale: String?
    let windSpeed, humidity, precip, pressure: String?
    let vis, cloud, dew: String?
}

// MARK: DWNow convenience initializers and mutators

extension DWNow {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWNow.self, from: data)
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
        obsTime: String?? = nil,
        temp: String?? = nil,
        feelsLike: String?? = nil,
        icon: String?? = nil,
        text: String?? = nil,
        wind360: String?? = nil,
        windDir: String?? = nil,
        windScale: String?? = nil,
        windSpeed: String?? = nil,
        humidity: String?? = nil,
        precip: String?? = nil,
        pressure: String?? = nil,
        vis: String?? = nil,
        cloud: String?? = nil,
        dew: String?? = nil
    ) -> DWNow {
        return DWNow(
            obsTime: obsTime ?? self.obsTime,
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            icon: icon ?? self.icon,
            text: text ?? self.text,
            wind360: wind360 ?? self.wind360,
            windDir: windDir ?? self.windDir,
            windScale: windScale ?? self.windScale,
            windSpeed: windSpeed ?? self.windSpeed,
            humidity: humidity ?? self.humidity,
            precip: precip ?? self.precip,
            pressure: pressure ?? self.pressure,
            vis: vis ?? self.vis,
            cloud: cloud ?? self.cloud,
            dew: dew ?? self.dew
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
