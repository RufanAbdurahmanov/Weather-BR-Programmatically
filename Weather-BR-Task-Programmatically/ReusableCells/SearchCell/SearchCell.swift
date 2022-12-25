//
//  SearchCell.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 24.12.22.
//


import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
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
        addSubview(cityLabel)
        cityLabel.fillSuperView()
        
        backgroundColor = UIColor(red: 56/255, green: 44/255, blue: 112/255, alpha: 1)
        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
    }
    
    func configure(cityName: String) {
        self.cityLabel.text = "    \(cityName)"
    }
}


