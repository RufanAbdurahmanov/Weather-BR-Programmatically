//
//  TopCollectionCell.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import UIKit

struct TopCollectionCellModel {
    let image: String
    let text1: String
    let text2: String
}

class TopCollectionCell: UICollectionViewCell {
    
    private var data: TopCollectionCellModel?
    
    private lazy  var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var label1: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var label2: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor(red: 56/255, green: 44/255, blue: 112/255, alpha: 1)
        layer.cornerRadius = 18
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        
        addSubview(imageView)
        addSubview(label1)
        addSubview(label2)
        
        imageView.anchor(top: nil, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: CGSize(width: 26, height: 0))
        
        label1.anchor(top: self.imageView.bottomAnchor, bottom: self.label1.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 18))
        label1.centerYSuperView()
        
        label2.anchor(top: nil, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 4, right: 0) ,size: CGSize(width: 0, height: 18))
    }
    
    
    func configure(data: TopCollectionCellModel?) {
        if data != nil {
            self.data = data!
            self.imageView.image = UIImage(systemName: data!.image)
            self.label1.text = data?.text1
            self.label2.text = data?.text2
        }
    }
}
