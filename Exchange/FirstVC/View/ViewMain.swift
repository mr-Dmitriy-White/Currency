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
        imageView.layer.zPosition = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelDate: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 3
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "AcademyEngravedLetPlain ", size: 20)
        return label
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
        addSubview(labelDate)
    }
    
    func setupConstraints(){
        imageBack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageBack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageBack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageBack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageBlure.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageBlure.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -100).isActive = true
        imageBlure.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageBlure.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        labelDate.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelDate.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        labelDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelDate.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func updateLabel(_ text: String){
        labelDate.text = "Last refresh:" + text
    }
}
