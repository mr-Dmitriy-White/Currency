//
//  ViewMain.swift
//  Exchange
//
//  Created by Dima Biliy on 17.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class ViewMain: UIView {
    
    let imageBack: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back")
        imageView.layer.zPosition = -1
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageBlure: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blure")
        imageView.layer.zPosition = 1
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addOnView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addOnView(){
        addSubview(imageBack)
        addSubview(imageBlure)
    }
    
    func setupConstraints(){
        imageBack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageBack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageBack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageBack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageBlure.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageBlure.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageBlure.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageBlure.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
