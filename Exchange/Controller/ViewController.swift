//
//  ViewController.swift
//  Exchange
//
//  Created by Dima Biliy on 17.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView : ViewMain = ViewMain()
    var collectionView = MainCollectionView()
    var outPut : PresenterOutput!
    var buttonView = ButtonView()
    
    override func loadView() {
        view = mainView
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.mockViewsPoints = outPut.dataRequest()
        outPut.networkRequest()
        addCollectionViewSettings()
        
        buttonView.delegate = self
    }
    
    func addCollectionViewSettings(){
        view.addSubview(collectionView)
        collectionView.layer.zPosition = 1
        collectionView.topAnchor.constraint(equalTo: view.centerYAnchor,constant: -100).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(buttonView)
        buttonView.layer.zPosition = 2
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.topAnchor.constraint(equalTo: view.centerYAnchor,constant: 100).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

extension ViewController: PresenterInput{
    func show(_ date: String) {
        buttonView.updateLabel(date)
    }
}

extension ViewController: MainViewDelegate{
    func didPressedActionRefresh() {
        print("refresh")
    }
    
    func didPressedActionDetail() {
        print("Detail")
    }
}
