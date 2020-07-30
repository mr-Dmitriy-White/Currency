//
//  ViewSecond.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit
import SpriteKit

protocol DetailViewDelegate: AnyObject {
    func didPressedActionBack()
}

class ViewDetail: UIView {
    
    weak var delegate : DetailViewDelegate?

    let imageBlure: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blure")
        imageView.layer.zPosition = 21
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let topImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "topImage")
        imageView.layer.zPosition = 20
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageTransition: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "transition")
        imageView.layer.zPosition = 20
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageDarkBack: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "darkBack")
        imageView.layer.zPosition = -1
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //round
    let imageRoundMoving: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "round")
        imageView.layer.zPosition = 3
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let imageRoundMoving2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "round")
        imageView.layer.zPosition = 3
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let imageRound: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoRound")
        imageView.layer.zPosition = 4
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let buttonBack: UIButton = {
       let button = UIButton(type: .system)
       button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backSelector), for: .touchUpInside)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.layer.zPosition = 22
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addOnView()
        setupConstraints()
        backgroundColor = UIColor(red: 0.204, green: 0.182, blue: 0.29, alpha: 1.0)
        _ = Timer.scheduledTimer(timeInterval: 2.1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addOnView(){
        addSubview(imageBlure)
        addSubview(topImage)
        addSubview(imageTransition)
        addSubview(imageDarkBack)
        addSubview(imageRoundMoving)
        addSubview(imageRound)
        addSubview(imageRoundMoving2)
        addSubview(buttonBack)
        
        imageDarkBack.addSubview(SKView(withEmitter: "MyParticle"))
    }
    
    func setupConstraints(){
        imageBlure.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageBlure.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0).isActive = true
        imageBlure.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageBlure.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        topImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        topImage.topAnchor.constraint(equalTo: topAnchor,constant: 0).isActive = true
        topImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageTransition.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageTransition.topAnchor.constraint(equalTo: centerYAnchor,constant: 110).isActive = true
        imageTransition.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageTransition.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageDarkBack.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 55).isActive = true
        imageDarkBack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageDarkBack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageDarkBack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageRoundMoving.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageRoundMoving.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -150).isActive = true
        imageRoundMoving.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageRoundMoving.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        imageRoundMoving2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageRoundMoving2.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -150).isActive = true
        imageRoundMoving2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageRoundMoving2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        imageRound.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageRound.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -150).isActive = true
        imageRound.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageRound.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        buttonBack.heightAnchor.constraint(equalToConstant: 25).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 20).isActive = true
        buttonBack.leftAnchor.constraint(equalTo: leftAnchor,constant: 25).isActive = true
        buttonBack.centerYAnchor.constraint(equalTo: topImage.centerYAnchor,constant: 10).isActive = true
    }
    
    @objc func fireTimer() {
        UIView.animate(withDuration: 2, animations: {
            self.imageRoundMoving.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.imageRoundMoving.alpha = 0
        }) { (true) in
            self.imageRoundMoving.transform = .identity
            self.imageRoundMoving.alpha = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 2, animations: {
                self.imageRoundMoving2.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.imageRoundMoving2.alpha = 0
            }) { (true) in
                self.imageRoundMoving2.transform = .identity
                self.imageRoundMoving2.alpha = 1
            }
        }
    }
    
    @objc func backSelector(){
        delegate?.didPressedActionBack()
    }
}
