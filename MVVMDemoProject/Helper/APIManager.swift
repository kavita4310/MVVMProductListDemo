//
//  APIManager.swift
//  MVVMDemoProject
//
//  Created by kavita chauhan on 24/01/24.
//

import UIKit

enum DataError:Error{
    case invalidResponse
    case invalidUrl
    case invalidData
    case network(Error?)
}

typealias handler = (Result<[ProductsData],DataError>)-> Void
final class APIManager{
    static let shared = APIManager()
    
    // The final keyword prevent inheritance of and prevent ovverride of methods and properties
    
//    MARK: Singleton desing Patterns
    
//    WHEN we can access method of both with creating bojects or with shared instance which is call small singleton**  -=-=-=-  init(){}
    
    // when we access any class properties or methods with only shared instance which is called capital Singleton**   -=-=-=-  private init(){}  prevent create object outside of class
    
    

    
    func fetchProducts(competion:@escaping handler){
        guard let url = URL(string: Constant.API.productUrl)else{ return }
        //URLSession - build connection with server
        //dataTask - give data from url
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data,error == nil else {
                competion(.failure(.invalidData))
                return}
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else { 
                competion(.failure(.invalidResponse))
                return }
            
            //JSONDecoder()- convert data into model
            do{
                let product = try JSONDecoder().decode([ProductsData].self, from: data)
                competion(.success(product))
            }catch{
                competion(.failure(.network(error)))
            }
            
//            if error != nil {
//                print(error!.localizedDescription)
//            }
        }.resume()
        
    }
}











