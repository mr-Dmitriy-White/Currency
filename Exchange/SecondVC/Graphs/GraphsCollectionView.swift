//
//  GraphsCollectionView.swift
//  Exchange
//
//  Created by Dima Biliy on 27.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class CollectionViewGraphs: UICollectionView {
    
    var cells = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Des"]
    
    var randomPersent = [(Int(),Bool())]{
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        dataSource = self
        delegate = self
        backgroundColor = .clear
        register(CollectionViewCellGraphs.self, forCellWithReuseIdentifier: CollectionViewCellGraphs.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewGraphs: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CollectionViewCellGraphs.reuseId, for: indexPath) as! CollectionViewCellGraphs
        cell.labelMonth.text = cells[indexPath.row]
        return cell
    }
}

extension CollectionViewGraphs: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/7, height: 210)
    }
}

