//
//  TopCollectionCell.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import UIKit

struct TopViewCellModel {
    let image: String
    let label1: String
    let label2: String
}

class TopCollectionCell: UICollectionViewCell {
    
    var data: TopViewCellModel?
    
    lazy  var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var label1: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var label2: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 26.0),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            label1.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            label1.bottomAnchor.constraint(equalTo: self.label1.topAnchor),
            label1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label1.heightAnchor.constraint(equalToConstant: 18),
            label1.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            label2.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label2.heightAnchor.constraint(equalToConstant: 18),
            label2.widthAnchor.constraint(equalTo: self.widthAnchor),
            
        ])
    }
    
    
    func configure(data: TopViewCellModel?) {
        
    
        if data != nil {
            self.data = data!
            self.imageView.image = UIImage(systemName: data!.image)
            self.label1.text = data?.label1
        
            self.label2.text = data?.label2
        }
        
    }
    

}
