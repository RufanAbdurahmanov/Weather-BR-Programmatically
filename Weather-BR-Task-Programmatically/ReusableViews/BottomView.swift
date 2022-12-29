//
//  BottomView.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 29.12.22.
//

import Foundation
import UIKit
 
class BottomView: UIView {
    
    private lazy var daysForecastLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1.0
        self.addSubview(view)
        return view
    }()
    
    private lazy var daysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 270)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = .clear
        collView.showsHorizontalScrollIndicator = false
        collView.register(DaysCollectionCell.self, forCellWithReuseIdentifier: DaysCollectionCell.identifier)
        self.addSubview(collView)
        return collView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    setupConstraints()
    }
    var weather: [CurrentConditions] = []
    
    func configure(data: [CurrentConditions]) {
        self.weather = data
        self.daysForecastLabel.text = "14 Days forecast"
        DispatchQueue.main.async {
            self.daysCollectionView.reloadData()
        }
    }
    
    private func setupConstraints() {
        daysForecastLabel.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 38, left: 0, bottom: 12, right: 16), size: CGSize(width: 0, height: 24))
        
        lineView.anchor(top: daysForecastLabel.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
        
        daysCollectionView.anchor(top: lineView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 28, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 230))
    }
    
}

extension BottomView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = daysCollectionView.dequeueReusableCell(withReuseIdentifier: DaysCollectionCell.identifier, for: indexPath) as! DaysCollectionCell
        cell.configure(data: weather[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: daysCollectionView.frame.height)
        
    }
}
