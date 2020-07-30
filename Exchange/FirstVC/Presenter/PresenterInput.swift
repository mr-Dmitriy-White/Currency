//
//  PresenterInput.swift
//  Exchange
//
//  Created by Dima Biliy on 23.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

protocol PresenterInput: AnyObject {
    var collectionView: MainCollectionView { get set } 
    func show(_ date: String)
    func present(vc: UIViewController)
}
