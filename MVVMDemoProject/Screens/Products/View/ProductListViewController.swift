//
//  ProductListViewController.swift
//  MVVMDemoProject
//
//  Created by kavita chauhan on 25/01/24.
//

import UIKit

class ProductListViewController: UIViewController {

    
    @IBOutlet weak var productTableVw: UITableView!
    var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        productTableVw.delegate = self
        productTableVw.dataSource = self
   
    }
}

extension ProductListViewController{
    func configuration(){
        
        let productNib = UINib(nibName: "ProductTableCell", bundle: nil)
        self.productTableVw.register(productNib, forCellReuseIdentifier: "ProductTableCell")
        
        initViewModel()
        observerEvents()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
   // Observe data binding events -- communication
    func observerEvents(){
        viewModel.eventHandler = {[weak self] event in
            guard let self else {return}
            switch event{
                
            case .loading:
                break
            case .stopLoading:
                break
            case .dataLoaded:
                print(self.viewModel.products)
                DispatchQueue.main.async {
                    self.productTableVw.reloadData()
                }
                
            case .error(let error):
                print(error!)
            }
            
        }
        
    }
    
}


extension ProductListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath) as? ProductTableCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
}
