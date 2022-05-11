//
//  ViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/3.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    var mainView: UIView?
    var mainVC: DWWeatherViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        struct Login: Codable {
            let code: Int
            let username, password: String
        }
        
        let params = Login.init(code: 3, username: "Dachong", password: "123456")
        
        DWNetworkService.post(url: "http://server.daccc.cn:8080/parentHelper/loginServlet", parms: params, succ: { data in
            guard let dict:[String: Any] = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            print(dict.values)
        }, fail: { errorText in
            print(errorText)
        })
        
        mainView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        self.view.addSubview(mainView!)
        mainVC = DWWeatherViewController()
        mainView!.addSubview(mainVC!.view)
    }
    
    // MARK: UI
    private func initUI() {
        self.view.backgroundColor = DWColorHelper.dynamicColor()
    }
    
    // MARK: Life Cycle
    override func viewSafeAreaInsetsDidChange() {
        mainView?.snp.makeConstraints({ make in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                make.edges.equalTo(UIEdgeInsets.zero)
            }
        })
        
        mainVC?.view.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }


}

