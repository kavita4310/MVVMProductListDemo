//
//  ProductTableCell.swift
//  MVVMDemoProject
//
//  Created by kavita chauhan on 27/01/24.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var btnRating: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var amount: UILabel!
    var product:ProductsData?{
        didSet{
            productDetailConfiguration()
        }
    }
    
    @IBOutlet weak var btnPay: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func productDetailConfiguration(){
        guard let product else { return }
        lblTitle.text = product.title
        lblDescription.text = product.description
        ratingLbl.text = product.category
        amount.text = "$\(product.price)"
        btnRating.setTitle("\(product.rating.rate)", for: .normal)
        imgImage.setImage(with: product.image)
    }
}
