//
//  MainCollectionView.swift
//  Exchange
//
//  Created by Dima Biliy on 17.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class MainCollectionView: UICollectionView {
    
    let imageArray = ["1","2","3","4","5","6","7"]
    var mockViewsPoints = [[Double()]]
    
    var imageArrayIndex = 0
    
    var cells = MoneyModel(rates: ["" : 0], base: "", date: ""){
        didSet {
            while self.cells.rates.count == self.mockViewsPoints.count {
                self.mockViewsPoints.removeLast()
            }
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
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.rates.values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseId, for: indexPath) as! MainCollectionViewCell
        
        cell.labelCurensy.text = String(Array(cells.rates.keys)[indexPath.row])
        cell.labelOnImage.text = String(Array(cells.rates.keys)[indexPath.row])
        cell.labelMoney.text = String(Array(cells.rates.values)[indexPath.row])
        cell.labelDate.text = cells.date
        cell.viewGraphs.receive(points: mockViewsPoints[indexPath.row])
        
        if imageArrayIndex == 6{
            imageArrayIndex = 0
        }
        cell.imageGradient.image = UIImage(named: imageArray[imageArrayIndex])
        imageArrayIndex += 1
        
        return cell
    }
}

extension MainCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
}
