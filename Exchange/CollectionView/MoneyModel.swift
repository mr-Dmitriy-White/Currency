//
//  MoneyModel.swift
//  Exchange
//
//  Created by Dima Biliy on 18.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

struct MoneyModel: Decodable {
    let rates: [String: Double]
    let base, date: String
}

