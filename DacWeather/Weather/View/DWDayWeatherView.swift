//
//  DWDayWeatherView.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/16.
//

import UIKit
import SnapKit

class DWDayWeatherView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // 圆角矩形边框
    private var cornerRectView: UIView?
    // 15日天气预报标签
    private var textLabel_15day: UILabel?
    // 渐变view
    private var startGradientView, endGradientView: DWGradientView?
    // 逐日天气预报列表
    private var collectionView: UICollectionView?
    private var dayWeather = [DWDaily]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    private func initUI() {
        // 圆角矩形
        cornerRectView = UIView(frame: self.frame)
        cornerRectView?.layer.cornerRadius = 8
        cornerRectView?.layer.masksToBounds = true
        cornerRectView?.backgroundColor = DWColorHelper.Theme.themeGreen
        self.addSubview(cornerRectView!)
        
        // 15日天气预报标签
        textLabel_15day = DWLabel(frame: CGRect.zero)
        textLabel_15day?.text = "15日天气预报"
        textLabel_15day?.textColor = UIColor.white
        textLabel_15day?.font = UIFont.systemFont(ofSize: DWFontHelper.normalSize)
        textLabel_15day?.backgroundColor = DWColorHelper.Theme.themeBrown
        textLabel_15day?.sizeToFit()
        textLabel_15day?.layer.cornerRadius = 4
        textLabel_15day?.layer.masksToBounds = true
        textLabel_15day?.sizeToFit()
        self.addSubview(textLabel_15day!)
        
        // 逐天天气预报列表
        setupCollectionView()
        
        // 渐变view
        startGradientView = DWGradientView(frame: CGRect.zero, startColor: DWColorHelper.Theme.themeGreen, endColor: DWColorHelper.Theme.themeGreen.withAlphaComponent(0.2), leftToRight: false)
        endGradientView = DWGradientView(frame: CGRect.zero, startColor: DWColorHelper.Theme.themeGreen, endColor: DWColorHelper.Theme.themeGreen.withAlphaComponent(0.2), leftToRight: false)
        endGradientView?.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.addSubview(startGradientView!)
        self.addSubview(endGradientView!)
        
        setupConstraints()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.register(DWDayWeatherCell.self, forCellWithReuseIdentifier: DWDayWeatherCell.description())
        self.addSubview(collectionView!)
    }
    
    private func setupConstraints() {
        cornerRectView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        textLabel_15day?.snp.makeConstraints({ make in
            make.right.top.equalToSuperview().inset(16)
        })
        collectionView?.snp.makeConstraints({ make in
            make.top.equalTo(textLabel_15day!.snp.bottom)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        })
        // 渐变view
        startGradientView?.snp.makeConstraints({ make in
            make.left.right.top.equalTo(collectionView!)
            make.height.equalTo(20)
        })
        endGradientView?.snp.makeConstraints({ make in
            make.left.right.bottom.equalTo(collectionView!)
            make.height.equalTo(20)
        })
        
    }
    
    
    
    // MARK: Data
    public func setDayWeatherData(_ dayWeatherData: DWDayWeatherModel) {
        self.dayWeather = dayWeatherData.daily ?? []
        collectionView?.reloadData()
    }

}

// MARK: UICollectionViewDataSource
extension DWDayWeatherView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayWeather.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row >= dayWeather.count) {
            return collectionView.dequeueReusableCell(withReuseIdentifier: DWDayWeatherCell.description(), for: indexPath)
        }
        let weather = dayWeather[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DWDayWeatherCell.description(), for: indexPath) as? DWDayWeatherCell {
            cell.setFxDate(weather.fxDate ?? "未知")
            cell.setWeatherIcon(UIImage(named: (weather.iconDay ?? "100") + ".png"))
            cell.setWeatherText(weather.textDay ?? "未知")
            cell.setMinTemperature((weather.tempMin ?? "未知") + "°C")
            cell.setMaxTemperature((weather.tempMax ?? "未知") + "°C")
            return cell
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: DWDayWeatherCell.description(), for: indexPath)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension DWDayWeatherView {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.dw_width, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}
