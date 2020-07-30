//
//  PresenterInputDetail.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

protocol PresenterInputDetail: AnyObject {
   var collectionView: CollectionViewDetail { get set }
    func present(vc: UIViewController)
}
