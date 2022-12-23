//
//  DaysCollectionCell.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import UIKit

class DaysCollectionCell: UICollectionViewCell {
        
        lazy var dateLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
        lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        
        
        lazy var tempLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        lazy var maxTempLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        lazy var minTempLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
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
    
    NSLayoutConstraint.activate([
        
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
        dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        dateLabel.heightAnchor.constraint(equalToConstant: 20),
        
        conditionLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 8),
        conditionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
        conditionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        conditionLabel.heightAnchor.constraint(equalToConstant: 30),
        
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        imageView.heightAnchor.constraint(equalToConstant: 60.0),
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
        
        tempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
        tempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        tempLabel.heightAnchor.constraint(equalToConstant: 16),
        tempLabel.bottomAnchor.constraint(equalTo: maxTempLabel.topAnchor, constant: -8),
        
        
        maxTempLabel.topAnchor.constraint(equalTo: self.tempLabel.bottomAnchor, constant: 8),
        maxTempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
        maxTempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        maxTempLabel.heightAnchor.constraint(equalToConstant: 16),


        minTempLabel.topAnchor.constraint(equalTo: self.maxTempLabel.bottomAnchor, constant: 8),
        minTempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
        minTempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        minTempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
        minTempLabel.heightAnchor.constraint(equalToConstant: 16),
    ])
}
    
    func configure(data: CurrentConditions) {
      
                    self.dateLabel.dateToString(text: data.datetime ?? "")
            
            self.conditionLabel.text = data.conditions ?? ""
            self.imageView.loadImage(imageURL: "\(String(describing: data.icon ?? ""))")
            
            self.tempLabel.text = "\(String(describing: data.temp ?? 0.0))"
            
            self.maxTempLabel.text = "\(String(describing: data.tempmax ?? 0.0))"
            self.minTempLabel.text = "\(String(describing: data.tempmin ?? 0.0))"

    }
      

    
}
