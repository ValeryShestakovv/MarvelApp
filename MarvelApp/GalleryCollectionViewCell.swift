//
//  GaleryCollectionViewCell.swift
//  MarvelApp
//
//  Created by Valery Shestakov on 19.07.2022.
//

import Foundation
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let textLable: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        addSubview(textLable)
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        textLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.mainImageView.layer.masksToBounds = true
        self.mainImageView.layer.cornerRadius = CGFloat(roundf(Float(self.mainImageView.frame.size
            .width/15.0)))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
