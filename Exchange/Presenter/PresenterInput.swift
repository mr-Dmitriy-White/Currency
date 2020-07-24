//
//  PresenterInput.swift
//  Exchange
//
//  Created by Dima Biliy on 23.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

protocol PresenterInput: AnyObject {
    var collectionView: MainCollectionView { get set } 
    func show(_ date: String)
}
