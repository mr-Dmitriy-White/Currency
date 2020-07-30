//
//  PresenterOutputDetail.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

protocol PresenterOutputDetail: AnyObject {
    func networkRequest()
    func randomPersent() -> [(Int,Bool)]
    func didPressedActionBack()
}
