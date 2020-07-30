//
//  ViewControllerDetail.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController,PresenterInputDetail {
    
    var mainView : ViewDetail = ViewDetail()
    var collectionView = CollectionViewDetail()
    var outPut : PresenterOutputDetail!
    var collectionViewGraphs = CollectionViewGraphs()
    
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
        addCollectionViewSettings()
        outPut.networkRequest()
        collectionView.randomPersent = outPut.randomPersent()
        mainView.delegate = self
    }
    
    func addCollectionViewSettings(){
        view.addSubview(collectionView)
        collectionView.layer.zPosition = 1
        collectionView.topAnchor.constraint(equalTo: view.centerYAnchor,constant: 140).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(collectionViewGraphs)
        collectionViewGraphs.topAnchor.constraint(equalTo: view.centerYAnchor,constant: -70).isActive = true
        collectionViewGraphs.bottomAnchor.constraint(equalTo: collectionView.topAnchor,constant: -30).isActive = true
        collectionViewGraphs.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionViewGraphs.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func present(vc: UIViewController){
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension ViewControllerDetail: DetailViewDelegate{
    func didPressedActionBack() {
        outPut.didPressedActionBack()
    }
}
