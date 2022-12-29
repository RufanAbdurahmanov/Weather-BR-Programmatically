//
//  CustomTopView.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 29.12.22.
//

import Foundation
import UIKit


class CustomTopView: UIView {
    
    private lazy var citynameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    setupConstraints()
    }
    
    
    func configure(cityName: String, condition: String) {
        self.citynameLabel.text = cityName
        self.conditionLabel.text = condition
    }
    
    
    func setupConstraints() {
        citynameLabel.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor,padding: .init(top: 8, left: 40, bottom: 0, right: 40),size: CGSize(width: 0, height: 36))
        
        conditionLabel.anchor(top: citynameLabel.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor,padding: .init(top: 4, left: 40, bottom: 0, right: 40),size: CGSize(width: 0, height: 20))
    }

}
