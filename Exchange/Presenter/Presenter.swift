//
//  Presenter.swift
//  Exchange
//
//  Created by Dima Biliy on 22.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

class MainPresenter: PresenterOutput {
    
    var dataManager: DataManager
    var networking: NetworkProtocol
    var view : PresenterInput!
    
    init(networking: NetworkProtocol, dataManager: DataManager){
        self.networking = networking
        self.dataManager = dataManager
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
    
    func dataRequest() -> [[Double]]{
        return dataManager.obtainNumbers()
    }
    
    func didPressedAction() {
        print("press")
    }
}
