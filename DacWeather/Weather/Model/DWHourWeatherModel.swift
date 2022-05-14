//
//  DWHourWeatherModel.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/14.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dWWeatherModel = try DWWeatherModel(json)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDWWeatherModel { response in
//     if let dWWeatherModel = response.result.value {
//       ...
//     }
//   }

/*
 {
   "code": "200",
   "updateTime": "2021-02-16T13:35+08:00",
   "fxLink": "http://hfx.link/2ax1",
   "hourly": [
     {
       "fxTime": "2021-02-16T15:00+08:00",
       "temp": "2",
       "icon": "100",
       "text": "晴",
       "wind360": "335",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "20",
       "humidity": "11",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-25"
     },
     {
       "fxTime": "2021-02-16T16:00+08:00",
       "temp": "1",
       "icon": "100",
       "text": "晴",
       "wind360": "339",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "24",
       "humidity": "11",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-26"
     },
     {
       "fxTime": "2021-02-16T17:00+08:00",
       "temp": "0",
       "icon": "100",
       "text": "晴",
       "wind360": "341",
       "windDir": "西北风",
       "windScale": "4-5",
       "windSpeed": "25",
       "humidity": "11",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1026",
       "cloud": "0",
       "dew": "-26"
     },
     {
       "fxTime": "2021-02-16T18:00+08:00",
       "temp": "0",
       "icon": "150",
       "text": "晴",
       "wind360": "344",
       "windDir": "西北风",
       "windScale": "4-5",
       "windSpeed": "25",
       "humidity": "12",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-16T19:00+08:00",
       "temp": "-2",
       "icon": "150",
       "text": "晴",
       "wind360": "349",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "24",
       "humidity": "13",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-16T20:00+08:00",
       "temp": "-3",
       "icon": "150",
       "text": "晴",
       "wind360": "353",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "22",
       "humidity": "14",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-16T21:00+08:00",
       "temp": "-3",
       "icon": "150",
       "text": "晴",
       "wind360": "355",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "20",
       "humidity": "14",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1026",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-16T22:00+08:00",
       "temp": "-4",
       "icon": "150",
       "text": "晴",
       "wind360": "356",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "18",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1026",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-16T23:00+08:00",
       "temp": "-4",
       "icon": "150",
       "text": "晴",
       "wind360": "356",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "18",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1026",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-17T00:00+08:00",
       "temp": "-4",
       "icon": "150",
       "text": "晴",
       "wind360": "354",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1027",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-17T01:00+08:00",
       "temp": "-4",
       "icon": "150",
       "text": "晴",
       "wind360": "351",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1028",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-17T02:00+08:00",
       "temp": "-4",
       "icon": "150",
       "text": "晴",
       "wind360": "350",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1028",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-17T03:00+08:00",
       "temp": "-5",
       "icon": "150",
       "text": "晴",
       "wind360": "350",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1028",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-17T04:00+08:00",
       "temp": "-5",
       "icon": "150",
       "text": "晴",
       "wind360": "351",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "15",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1027",
       "cloud": "0",
       "dew": "-28"
     },
     {
       "fxTime": "2021-02-17T05:00+08:00",
       "temp": "-5",
       "icon": "150",
       "text": "晴",
       "wind360": "352",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "14",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1026",
       "cloud": "0",
       "dew": "-29"
     },
     {
       "fxTime": "2021-02-17T06:00+08:00",
       "temp": "-5",
       "icon": "150",
       "text": "晴",
       "wind360": "355",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "14",
       "humidity": "16",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "0",
       "dew": "-27"
     },
     {
       "fxTime": "2021-02-17T07:00+08:00",
       "temp": "-7",
       "icon": "150",
       "text": "晴",
       "wind360": "359",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "20",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1024",
       "cloud": "0",
       "dew": "-26"
     },
     {
       "fxTime": "2021-02-17T08:00+08:00",
       "temp": "-5",
       "icon": "100",
       "text": "晴",
       "wind360": "1",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "14",
       "humidity": "19",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1023",
       "cloud": "0",
       "dew": "-26"
     },
     {
       "fxTime": "2021-02-17T09:00+08:00",
       "temp": "-4",
       "icon": "100",
       "text": "晴",
       "wind360": "356",
       "windDir": "北风",
       "windScale": "3-4",
       "windSpeed": "14",
       "humidity": "17",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1023",
       "cloud": "0",
       "dew": "-25"
     },
     {
       "fxTime": "2021-02-17T10:00+08:00",
       "temp": "-1",
       "icon": "100",
       "text": "晴",
       "wind360": "344",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "14",
       "humidity": "14",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1024",
       "cloud": "0",
       "dew": "-26"
     },
     {
       "fxTime": "2021-02-17T11:00+08:00",
       "temp": "0",
       "icon": "100",
       "text": "晴",
       "wind360": "333",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "14",
       "humidity": "12",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1024",
       "cloud": "0",
       "dew": "-26"
     },
     {
       "fxTime": "2021-02-17T12:00+08:00",
       "temp": "1",
       "icon": "100",
       "text": "晴",
       "wind360": "325",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "14",
       "humidity": "10",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "16",
       "dew": "-28"
     },
     {
       "fxTime": "2021-02-17T13:00+08:00",
       "temp": "2",
       "icon": "100",
       "text": "晴",
       "wind360": "319",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "8",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "32",
       "dew": "-29"
     },
     {
       "fxTime": "2021-02-17T14:00+08:00",
       "temp": "2",
       "icon": "100",
       "text": "晴",
       "wind360": "313",
       "windDir": "西北风",
       "windScale": "3-4",
       "windSpeed": "16",
       "humidity": "9",
       "pop": "0",
       "precip": "0.0",
       "pressure": "1025",
       "cloud": "48",
       "dew": "-27"
     }
   ],
   "refer": {
     "sources": [
       "QWeather",
       "NMC",
       "ECMWF"
     ],
     "license": [
       "commercial license"
     ]
   }
 }
 */

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dWHourWeatherModel = try DWHourWeatherModel(json)

import Foundation

// MARK: - DWHourWeatherModel
struct DWHourWeatherModel: Codable {
    let code, updateTime: String?
    let fxLink: String?
    let hourly: [DWHourly]?
    let refer: DWRefer?
}

// MARK: DWHourWeatherModel convenience initializers and mutators

extension DWHourWeatherModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWHourWeatherModel.self, from: data)
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
        hourly: [DWHourly]?? = nil,
        refer: DWRefer?? = nil
    ) -> DWHourWeatherModel {
        return DWHourWeatherModel(
            code: code ?? self.code,
            updateTime: updateTime ?? self.updateTime,
            fxLink: fxLink ?? self.fxLink,
            hourly: hourly ?? self.hourly,
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

// MARK: - DWHourly
struct DWHourly: Codable {
    let fxTime, temp, icon, text: String?
    let wind360, windDir, windScale, windSpeed: String?
    let humidity, pop, precip, pressure: String?
    let cloud, dew: String?
}

// MARK: DWHourly convenience initializers and mutators

extension DWHourly {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWHourly.self, from: data)
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
        fxTime: String?? = nil,
        temp: String?? = nil,
        icon: String?? = nil,
        text: String?? = nil,
        wind360: String?? = nil,
        windDir: String?? = nil,
        windScale: String?? = nil,
        windSpeed: String?? = nil,
        humidity: String?? = nil,
        pop: String?? = nil,
        precip: String?? = nil,
        pressure: String?? = nil,
        cloud: String?? = nil,
        dew: String?? = nil
    ) -> DWHourly {
        return DWHourly(
            fxTime: fxTime ?? self.fxTime,
            temp: temp ?? self.temp,
            icon: icon ?? self.icon,
            text: text ?? self.text,
            wind360: wind360 ?? self.wind360,
            windDir: windDir ?? self.windDir,
            windScale: windScale ?? self.windScale,
            windSpeed: windSpeed ?? self.windSpeed,
            humidity: humidity ?? self.humidity,
            pop: pop ?? self.pop,
            precip: precip ?? self.precip,
            pressure: pressure ?? self.pressure,
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
