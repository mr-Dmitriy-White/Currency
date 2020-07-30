//
//  PresenterDetail.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

class PresenterDetail: PresenterOutputDetail {

    var dataManager: DataManager
    var view : PresenterInputDetail!
    var networking: NetworkProtocol
    
    init(dataManager: DataManager, networking: NetworkProtocol){
        self.dataManager = dataManager
        self.networking = networking
    }
    
    func networkRequest(){
        networking.obtainPost(url: "https://api.exchangeratesapi.io/latest") { [weak self] (result: ObtainPostResult<MoneyModel>) in
            switch result{
            case .success(let posts):
                DispatchQueue.main.async {
                    self?.view.collectionView.cells = posts
                    print(posts)
                }
            case .failure(let error):
                print(error)
            case .faile( let myerror):
                print(myerror)
            }
        }
    }
    
    func randomPersent() -> [(Int,Bool)]{
        var arrayes = [(Int(),Bool())]
        for _ in 0...50{
        let persent = dataManager.randomPersent()
            arrayes.append(persent)
        }
        return arrayes
    }
    
    func didPressedActionBack() {
        let vc = MainModuleAssembley.configureModuleFirst()
        view.present(vc: vc)
    }
}
