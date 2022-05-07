//
//  DWNetworkService.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/7.
//

import Foundation
import Alamofire

class DWNetworkService: NSObject {
    
    public static func get<Parameters: Encodable>(url: String,
                                                  parms: Parameters?,
                                                  succ: ((Data)->Void)? = nil,
                                                  fail:((String)->Void)? = nil) {
        AF.request(url,
                   method: .get,
                   parameters: parms,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: nil)
        .validate()
        .responseData() { response in
            guard let data = response.value else {
                fail?(response.error?.errorDescription ?? "")
                return
            }
            succ?(data)
        }
    }
    
    public static func post<Parameters: Encodable>(url: String,
                                                   parms: Parameters?,
                                                   succ: ((Data)->Void)? = nil,
                                                   fail:((String)->Void)? = nil) {
        AF.request(url,
                   method: .post,
                   parameters: parms,
                   encoder: JSONParameterEncoder.default,
                   headers: nil)
        .validate()
        .responseData() { response in
            guard let data = response.value else {
                fail?(response.error?.errorDescription ?? "")
                return
            }
            succ?(data)
        }
        
    }
    
    public static func post(url: String,
                            parms: String?,
                            succ: ((Data)->Void)? = nil,
                            fail:((String)->Void)? = nil) {
        AF.request(url,
                   method: .post,
                   parameters: parms,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: nil)
        .validate()
        .responseData() { response in
            guard let data = response.value else {
                fail?(response.error?.errorDescription ?? "")
                return
            }
            succ?(data)
        }
        
    }
    
}
