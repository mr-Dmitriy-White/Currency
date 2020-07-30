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
    
    deinit {
        print("-------//////First vc deinit//////-----------")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.delegate = self
        collectionView.mockViewsPoints = outPut.dataRequest()
        outPut.networkRequest()
        addCollectionViewSettings()
    }
    
    func addCollectionViewSettings(){
        view.addSubview(collectionView)
        collectionView.layer.zPosition = 1
        collectionView.topAnchor.constraint(equalTo: view.centerYAnchor,constant: -100).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(buttonView)
        buttonView.layer.zPosition = 7
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}

extension ViewController: PresenterInput{
    func show(_ date: String) {
        mainView.updateLabel(date)
    }
    func present(vc: UIViewController){
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension ViewController: MainViewDelegate{
    func didPressedActionRefresh() {
        outPut.didPressedActionRefresh()
    }
    
    func didPressedActionDetail() {
        outPut.didPressedActionDetail()
    }
}
