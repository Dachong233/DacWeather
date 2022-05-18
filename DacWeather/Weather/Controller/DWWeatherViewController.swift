//
//  DWWeatherViewController.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/8.
//

import UIKit
import SnapKit

class DWWeatherViewController: UIViewController {
    private var cityLable: UILabel?
    private var nowWeatherViewController: DWNowWeatherViewController?
    private var hourWeatherViewController: DWHourWeatherViewController?
    private var dayWeatherViewController: DWDayWeatherViewController?
    private var scrollView: UIScrollView?
    private var contentView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        let location = "101280101"
        // Do any additional setup after loading the view.
        DWWeatherApiClient.sharedInstance.getNowWeather(location: location) { nowWeatherModel in
            self.nowWeatherViewController?.setNowWeatherData(nowWeatherModel)
            self.view.setNeedsLayout()
        } fail: { text in
            print("error: \(text)")
        }
        
        DWWeatherApiClient.sharedInstance.getHourWeather(location: location) { hourWeatherModel in
            self.hourWeatherViewController?.setHourWeatherData(hourWeatherModel)
            self.view.setNeedsLayout()
        } fail: { text in
            print("error: \(text)")
        }
        
        DWWeatherApiClient.sharedInstance.getDayWeather(location: location) { dayWeatherModel in
            self.dayWeatherViewController?.setDayWeatherData(dayWeatherModel)
            self.view.setNeedsLayout()
        } fail: { text in
            print("error: \(text)")
        }



    }
    
    
    // MARK: UI
    private func initUI() {
        self.view.backgroundColor = DWColorHelper.Theme.bgColor
        
        contentView = UIView(frame: CGRect.zero)
        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView?.addSubview(contentView!)
        self.view.addSubview(scrollView!)
        
        
        // 城市标签
        cityLable = UILabel()
        cityLable?.text = "广州"
        cityLable?.font = UIFont.boldSystemFont(ofSize: DWWeatherViewController.Size.cityLabelFontSize)
        cityLable?.frame = CGRect.zero
        cityLable?.sizeToFit()
        contentView?.addSubview(cityLable!)
        
        // 实时天气
        nowWeatherViewController = DWNowWeatherViewController()
        self.addChild(nowWeatherViewController!)
        contentView?.addSubview(nowWeatherViewController!.view)
        nowWeatherViewController!.didMove(toParent: self)
        
        // 小时天气
        hourWeatherViewController = DWHourWeatherViewController()
        self.addChild(hourWeatherViewController!)
        contentView?.addSubview(hourWeatherViewController!.view)
        nowWeatherViewController!.didMove(toParent: self)
        
        // 15天逐天天气
        dayWeatherViewController = DWDayWeatherViewController()
        self.addChild(dayWeatherViewController!)
        contentView?.addSubview(dayWeatherViewController!.view)
        dayWeatherViewController?.didMove(toParent: self)
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        // 城市标签
        cityLable?.snp.makeConstraints({ make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        })
        // 实时天气
        nowWeatherViewController!.view.snp.makeConstraints({ make in
            make.top.equalTo(cityLable!.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(180)
        })
        // 小时天气
        hourWeatherViewController!.view.snp.makeConstraints { make in
            make.top.equalTo(nowWeatherViewController!.view.snp.bottom).offset(20)
            make.left.right.equalTo(nowWeatherViewController!.view)
            make.height.equalTo(180)
        }
        // 逐天天气
        dayWeatherViewController!.view.snp.makeConstraints { make in
            make.top.equalTo(hourWeatherViewController!.view.snp.bottom).offset(20)
            make.left.right.equalTo(hourWeatherViewController!.view)
            make.height.equalTo(dayWeatherViewController!.contentSize().height)
        }
        // scrollView
        scrollView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        contentView!.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(dayWeatherViewController!.view.snp.bottom)
            make.horizontalEdges.equalTo(self.view)
        }
    }
    
    // MARK: Life Cycle
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView?.contentSize = contentView?.dw_size ?? CGSize.zero
    }
    
    
    
}

extension DWWeatherViewController {
    struct Size {
        static let cityLabelFontSize: CGFloat = 36
    }
    
}
