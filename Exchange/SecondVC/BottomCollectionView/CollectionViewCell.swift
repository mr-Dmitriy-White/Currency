//
//  CollectionViewCell.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class CollectionViewCellDetail: UICollectionViewCell {
    
    static let reuseId = "CollectionViewCellDetail"
    
    let imageGradient: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.layer.zPosition = 1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelOnImage: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "AlNile", size: 8)
        label.textAlignment = .center
        return label
    }()
    
    let labelCurensy: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "AlNile-Bold", size: 13)
        label.textAlignment = .left
        return label
    }()
    
    let labelDate: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.665, green: 0.654, blue: 0.689, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "AlNile", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let labelPersent: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.665, green: 0.654, blue: 0.689, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "AlNile", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    let imageUpOrDown: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.zPosition = 1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelMoney: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "AlNile", size: 15)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews(){
        addSubview(imageGradient)
        addSubview(labelOnImage)
        addSubview(labelCurensy)
        addSubview(labelDate)
        addSubview(labelPersent)
        addSubview(imageUpOrDown)
        addSubview(labelMoney)
    }
    
    func addConstraints(){
        imageGradient.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        imageGradient.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        imageGradient.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        imageGradient.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        labelOnImage.centerYAnchor.constraint(equalTo: imageGradient.centerYAnchor).isActive = true
        labelOnImage.centerXAnchor.constraint(equalTo: imageGradient.centerXAnchor).isActive = true
        labelOnImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        labelOnImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        labelCurensy.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        labelCurensy.bottomAnchor.constraint(equalTo: imageGradient.centerYAnchor,constant: -2).isActive = true
        labelCurensy.leftAnchor.constraint(equalTo: imageGradient.rightAnchor,constant: 0).isActive = true
        labelCurensy.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        labelDate.topAnchor.constraint(equalTo: imageGradient.centerYAnchor,constant: -5).isActive = true
        labelDate.bottomAnchor.constraint(equalTo: bottomAnchor ,constant: -15).isActive = true
        labelDate.leftAnchor.constraint(equalTo: imageGradient.rightAnchor,constant: 0).isActive = true
        labelDate.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        labelPersent.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelPersent.centerYAnchor.constraint(equalTo: imageGradient.centerYAnchor).isActive = true
        labelPersent.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelPersent.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        imageUpOrDown.centerXAnchor.constraint(equalTo: labelPersent.centerXAnchor, constant: 30).isActive = true
        imageUpOrDown.centerYAnchor.constraint(equalTo: labelPersent.centerYAnchor).isActive = true
        imageUpOrDown.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageUpOrDown.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        labelMoney.rightAnchor.constraint(equalTo: rightAnchor,constant: -50).isActive = true
        labelMoney.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelMoney.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelMoney.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
