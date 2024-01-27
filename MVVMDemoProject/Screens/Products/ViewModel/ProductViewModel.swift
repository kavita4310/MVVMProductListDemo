//
//  ProductViewModel.swift
//  MVVMDemoProject
//
//  Created by kavita chauhan on 27/01/24.
//

import Foundation

final class ProductViewModel{
    var products:[ProductsData] = []
    var eventHandler:((_ event:Events) -> Void)?// data binding through closure
    func fetchProducts(){
        eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response{
            case.success(let product):
                self.products = product
                self.eventHandler?(.dataLoaded)
            case.failure(let error):
                self.eventHandler?(.error(error))
                
            }
        }
    }
}
extension ProductViewModel{
    enum Events{
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error:Error?)
    }
}
