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
    var presenter : MainPresenter!
    
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
        
        collectionView.mockViewsPoints = presenter.dataRequest()
        presenter.networkRequest()
        addCollectionViewSettings()
    }
    
    func addCollectionViewSettings(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.centerYAnchor,constant: -100).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

