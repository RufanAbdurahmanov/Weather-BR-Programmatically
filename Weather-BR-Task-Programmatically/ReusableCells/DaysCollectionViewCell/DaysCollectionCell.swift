//
//  DaysCollectionCell.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import UIKit

class DaysCollectionCell: UICollectionViewCell {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white.withAlphaComponent(0.9)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor(red: 56/255, green: 44/255, blue: 112/255, alpha: 1)
        layer.cornerRadius = 18
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        
        addSubview(dateLabel)
        addSubview(conditionLabel)
        addSubview(imageView)
        addSubview(tempLabel)
        addSubview(maxTempLabel)
        addSubview(minTempLabel)
        
        dateLabel.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 16, left: 4, bottom: 0, right: 4), size: CGSize(width: 0, height: 20))
        
        conditionLabel.anchor(top: self.dateLabel.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 8, left: 4, bottom: 0, right: 4), size: CGSize(width: 0, height: 30))
        
        imageView.anchor(top: self.conditionLabel.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 70))
        
        tempLabel.anchor(top: nil, bottom: self.maxTempLabel.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 4, bottom: 16, right: 4), size: CGSize(width: 0, height: 16))
        
        
        maxTempLabel.anchor(top: self.tempLabel.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 8, left: 4, bottom: 0, right: 4), size: CGSize(width: 0, height: 16))
        
        minTempLabel.anchor(top: self.maxTempLabel.bottomAnchor, bottom: self.bottomAnchor, leading:  self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 8, left: 4, bottom: 12, right: 4), size: CGSize(width: 0, height: 16))
        
    }
    
    func configure(data: CurrentConditions) {
        
        self.dateLabel.dateToString(text: data.datetime ?? "")
        
        self.conditionLabel.text = data.conditions ?? ""
        self.imageView.loadImage(imageURL: "\(String(describing: data.icon ?? ""))")
        self.tempLabel.text = "\(String(describing: data.temp ?? 0.0)) °C"
        self.maxTempLabel.text = "Max: \(String(describing: data.tempmax ?? 0.0)) °C"
        self.minTempLabel.text = "Min: \(String(describing: data.tempmin ?? 0.0)) °C"
        
    }
    
}
