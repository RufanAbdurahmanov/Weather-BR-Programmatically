//
//  TopView.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 23.12.22.
//

import Foundation
import UIKit


struct TopViewModel {
    let temp: String
    let feelsLike: String
    let location : String
    let date: String
    let weatherIcon: String
    let topCollectionData: [TopCollectionCellModel]
}


class TopView: UIView {
    
    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 65, weight: .semibold)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    private lazy var degreeSelsiumLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .orange
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    private lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .gray.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()

    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .center
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .right
        self.addSubview(label)
        return label
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = nil
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 76, height: 66)
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = .clear
        collView.showsHorizontalScrollIndicator = false
        collView.register(TopCollectionCell.self, forCellWithReuseIdentifier: TopCollectionCell.identifier)
        self.addSubview(collView)
        return collView
    }()
    
    private var collectionData: [TopCollectionCellModel]?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        
        backgroundColor = UIColor(red: 48/255, green: 29/255, blue: 99/255, alpha: 1)
        layer.cornerRadius = 20
        layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1.0
    }
    
    func configure(cityName: String, data: TopViewModel) {
        todayLabel.text = "Today"
        tempLabel.text = data.temp
        degreeSelsiumLabel.text = "°C"
        feelsLikeLabel.text = "Feels like \(data.feelsLike)°C"
        locationImageView.image = UIImage(named: "map")
        locationLabel.text = cityName
        dateLabel.dateToString(text: data.date, short: false)
        iconImageView.loadImage(imageURL: data.weatherIcon)
        
        collectionData = data.topCollectionData
        
        collectionView.delegate = self
        collectionView.dataSource = self
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func setupConstraints() {
        
        todayLabel.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nil, padding: .init(top: 16, left: 20, bottom: 0, right: 0))
        
        tempLabel.anchor(top: todayLabel.bottomAnchor, bottom: nil, leading: todayLabel.leadingAnchor, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 70))
        
        degreeSelsiumLabel.anchor(top: tempLabel.topAnchor, bottom: nil, leading: tempLabel.trailingAnchor, trailing: nil, size: CGSize(width: 0, height: 25))
        
        feelsLikeLabel.anchor(top: tempLabel.bottomAnchor, bottom: nil, leading: todayLabel.leadingAnchor, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 20))
        
        locationImageView.anchor(top: feelsLikeLabel.bottomAnchor, bottom: nil, leading: todayLabel.leadingAnchor, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: CGSize(width: 23, height: 23))
        
        locationLabel.anchor(top: locationImageView.topAnchor, bottom: locationImageView.bottomAnchor, leading: locationImageView.trailingAnchor, trailing: nil, padding: .init(top: 0, left: 4, bottom: 0, right: 0))
        
        dateLabel.anchor(top: todayLabel.topAnchor, bottom: todayLabel.bottomAnchor, leading: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 24), size: .init(width: 120, height: 0))
        
        iconImageView.anchor(top: dateLabel.bottomAnchor, bottom: nil, leading: nil, trailing: self.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 28), size: CGSize(width: 100, height: 90))
        
        collectionView.anchor(top: nil, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 20, right: 24), size: CGSize(width: 0, height: 66))

    }
}


extension TopView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollectionCell.identifier, for: indexPath) as! TopCollectionCell
        cell.configure(data: collectionData![indexPath.item])
        return cell
    }
}
