//
//  GraphsCollectionViewCell.swift
//  Exchange
//
//  Created by Dima Biliy on 27.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class CollectionViewCellGraphs: UICollectionViewCell {
    
    static let reuseId = "CollectionViewCellGraphs"
    
    let labelMonth: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.48, green: 0.47, blue: 0.513, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "AlNile", size: 17)
        label.text = "dsf"
        label.textAlignment = .center
        return label
    }()
    
    let viewBack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.204, green: 0.182, blue: 0.29, alpha: 1.0)
        view.layer.zPosition = 2
        return view
    }()
    
    let viewGraphs: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1.0, green: 0.49, blue: 0.469, alpha: 1.0)
        view.layer.zPosition = 3
        return view
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
        addSubview(labelMonth)
        addSubview(viewBack)
        addSubview(viewGraphs)
    }
    
    func addConstraints(){
        labelMonth.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        labelMonth.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        labelMonth.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        labelMonth.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        viewBack.topAnchor.constraint(equalTo: topAnchor,constant: 60).isActive = true
        viewBack.rightAnchor.constraint(equalTo: rightAnchor,constant: -3).isActive = true
        viewBack.leftAnchor.constraint(equalTo: leftAnchor,constant: 3).isActive = true
        viewBack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        drawGraphs()
    }
    
    func drawGraphs(){
        let intrandom = Int.random(in: 30...150)
        viewGraphs.heightAnchor.constraint(equalToConstant: CGFloat(intrandom)).isActive = true
        viewGraphs.rightAnchor.constraint(equalTo: rightAnchor,constant: -3).isActive = true
        viewGraphs.leftAnchor.constraint(equalTo: leftAnchor,constant: 3).isActive = true
        viewGraphs.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

