//
//  DWHourWeatherView.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/14.
//

import UIKit
import SnapKit

class DWHourWeatherView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// 圆角矩形边框
    private var cornerRectView: UIView?
    /// 天气列表
    private var collectionView: UICollectionView?
    private var weatherArray = [DWHourly]()
    
    /// 文本标签：24小时预报
    private var textLabel_24hours: DWLabel?
    /// 渐变view
    private var startGradientView, endGradientView: DWGradientView?
    

    
    private var hourWeather: DWHourWeatherModel? {
        didSet {
            DispatchQueue.main.async {
                self.reloadWeatherData()
            }
        }
    }
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    // MARK: UI
    
    private func initUI() {
        // 圆角矩形
        cornerRectView = UIView(frame: self.frame)
        cornerRectView?.layer.cornerRadius = 8
        cornerRectView?.layer.masksToBounds = true
        cornerRectView?.backgroundColor = DWColorHelper.Theme.themePink
        self.addSubview(cornerRectView!)
        
        // 天气列表
        setupCollectionView()
        
        // 当前
        textLabel_24hours = DWLabel(frame: CGRect.zero)
        textLabel_24hours?.text = "24小时预报"
        textLabel_24hours?.textColor = UIColor.white
        textLabel_24hours?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        textLabel_24hours?.backgroundColor = DWColorHelper.Theme.themeGreen1
        textLabel_24hours?.sizeToFit()
        textLabel_24hours?.layer.cornerRadius = 4
        textLabel_24hours?.layer.masksToBounds = true
        self.addSubview(textLabel_24hours!)
        
        startGradientView = DWGradientView(frame: CGRect.zero, startColor: DWColorHelper.Theme.themePink, endColor: DWColorHelper.Theme.themePink.withAlphaComponent(0.2))
        endGradientView = DWGradientView(frame: CGRect.zero, startColor: DWColorHelper.Theme.themePink, endColor: DWColorHelper.Theme.themePink.withAlphaComponent(0.2))
        endGradientView?.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.addSubview(startGradientView!)
        self.addSubview(endGradientView!)
        
        setupConstraints()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(DWHourWeatherCell.self, forCellWithReuseIdentifier: DWHourWeatherCell.description())
        
        self.addSubview(collectionView!)
        
    }
    
    private func setupConstraints() {
        // 圆角矩形
        cornerRectView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        // 24小时天气预报列表
        collectionView?.snp.makeConstraints({ make in
            make.left.right.equalToSuperview()
            make.top.equalTo(textLabel_24hours!.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-20)
        })
        // 24小时天气预报标签
        textLabel_24hours?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        })
        // 渐变view
        startGradientView?.snp.makeConstraints({ make in
            make.left.top.bottom.equalTo(collectionView!)
            make.width.equalTo(20)
        })
        endGradientView?.snp.makeConstraints({ make in
            make.right.top.bottom.equalTo(collectionView!)
            make.width.equalTo(20)
        })
        
        
    }
    
    // MARK: data
    
    public func setHourWeatherData(_ hourWeather: DWHourWeatherModel) {
        self.hourWeather = hourWeather
    }
    
    private func reloadWeatherData() {
        if hourWeather != nil, let hourWeatherArray = hourWeather?.hourly {
            self.weatherArray = hourWeatherArray
            self.collectionView?.reloadData()
        }
        
    }
    
    
    

}

// MARK: UICollectionViewDataSource

extension DWHourWeatherView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { weatherArray.count }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let weather = self.weatherArray[indexPath.row]
        var time = "0:00"
        if let fxTime = weather.fxTime,
           let startIndex = fxTime.firstIndex(of: "T"),
           let endIndex = fxTime.firstIndex(of: "+") {
            time = String(fxTime[startIndex..<endIndex].dropFirst())
        }
              
        let icon = UIImage(named: (weather.icon ?? "100") + ".png")
        if let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: DWHourWeatherCell.description(), for: indexPath)) as? DWHourWeatherCell {
            cell.setTime(time)
            cell.setWeatherIcon(icon)
            cell.setWeatherText(weather.text ?? "未知")
            cell.setTemperature((weather.temp ?? "未知") + "°C")
            return cell
        }
        let cell = DWHourWeatherCell(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        cell.setTime(time)
        cell.setWeatherIcon(icon)
        cell.setWeatherText(weather.text ?? "未知")
        cell.setTemperature((weather.temp ?? "未知") + "°C")
        return cell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension DWHourWeatherView {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: self.collectionView!.dw_height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
}

// MARK: UICollectionViewDelegate
extension DWHourWeatherView {
    
}
