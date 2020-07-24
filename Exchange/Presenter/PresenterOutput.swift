//
//  PresenterOutput.swift
//  Exchange
//
//  Created by Dima Biliy on 23.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

protocol PresenterOutput: AnyObject {
    func didPressedAction()
    func networkRequest()
    func dataRequest() -> [[Double]]
}
