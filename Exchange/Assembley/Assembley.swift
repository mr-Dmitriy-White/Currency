//
//  Assembley.swift
//  Exchange
//
//  Created by Dima Biliy on 22.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

class MainModuleAssembley {
    class func configureModule() -> UIViewController{
        let view = ViewController()
        let presenter = MainPresenter(networking:  NetworkManager(),
                                      dataManager: DataManagerImplementation())
        view.outPut = presenter
        presenter.view = view
        return view
    }
}
