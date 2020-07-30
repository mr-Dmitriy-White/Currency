//
//  CollectionViewDetail.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class CollectionViewDetail: UICollectionView {
    
    let imageArray = ["1","2","3","4","5","6","7"]
    
    var imageArrayIndex = 0
    
    var cells = MoneyModel(rates: ["" : 0], base: "", date: ""){
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    var randomPersent = [(Int(),Bool())]{
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        dataSource = self
        delegate = self
        backgroundColor = .clear
        register(CollectionViewCellDetail.self, forCellWithReuseIdentifier: CollectionViewCellDetail.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewDetail: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.rates.values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CollectionViewCellDetail.reuseId, for: indexPath) as! CollectionViewCellDetail
        
        cell.labelCurensy.text = String(Array(cells.rates.keys)[indexPath.row])
        cell.labelOnImage.text = String(Array(cells.rates.keys)[indexPath.row])
        cell.labelPersent.text = String(randomPersent[indexPath.row].0) + " %"
        cell.labelDate.text = cells.date
        cell.labelMoney.text = String(Array(cells.rates.values)[indexPath.row])
        
        if randomPersent[indexPath.row].1{
          cell.imageUpOrDown.image = UIImage(named: "up")
        } else {
        cell.imageUpOrDown.image = UIImage(named: "down")
        }
        
        if imageArrayIndex == 6{
            imageArrayIndex = 0
            cell.imageGradient.image = UIImage(named: imageArray[imageArrayIndex])
        } else {
            cell.imageGradient.image = UIImage(named: imageArray[imageArrayIndex])
        }
        imageArrayIndex += 1
        
        return cell
    }
}

extension CollectionViewDetail: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 60)
    }
}
