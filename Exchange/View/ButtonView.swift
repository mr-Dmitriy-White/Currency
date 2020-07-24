//
//  ButtonView.swift
//  Exchange
//
//  Created by Dima Biliy on 23.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func didPressedActionRefresh()
    func didPressedActionDetail()
}

class ButtonView: UIView {

weak var delegate : MainViewDelegate?

    let imageUnderButtons: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageUnderButtons")
        imageView.layer.zPosition = 2
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let buttonRefresh: UIButton = {
       let button = UIButton(type: .system)
       button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(updateSelector), for: .touchUpInside)
        button.layer.zPosition = 3
        return button
    }()
    
    let buttonDetail: UIButton = {
       let button = UIButton(type: .system)
       button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(detailSelector), for: .touchUpInside)
        button.layer.zPosition = 3
        return button
    }()
    
    let labelDate: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 3
        label.text = "11.11.1111"
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
    
    func updateLabel(_ text: String){
        labelDate.text = text
    }
    
    func addOnView(){
        addSubview(imageUnderButtons)
        addSubview(buttonRefresh)
        addSubview(buttonDetail)
        addSubview(labelDate)
    }
    
    func setupConstraints(){
        imageUnderButtons.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageUnderButtons.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageUnderButtons.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageUnderButtons.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        buttonRefresh.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        buttonRefresh.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonRefresh.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        buttonRefresh.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        buttonDetail.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        buttonDetail.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonDetail.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        buttonDetail.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        labelDate.rightAnchor.constraint(equalToSystemSpacingAfter: rightAnchor, multiplier: 0.5).isActive = true
        labelDate.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.5).isActive = true
        labelDate.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 0.5).isActive = true
        labelDate.rightAnchor.constraint(equalToSystemSpacingAfter: rightAnchor, multiplier: 0.5).isActive = true
    }
    
    @objc func updateSelector(){
        delegate?.didPressedActionRefresh()
    }
    
    @objc func detailSelector(){
        delegate?.didPressedActionDetail()
    }
}
