//
//  ProductCell.swift
//  Clase12Ejercicio1
//
//  Created by Mac on 3/01/23.
//

import UIKit

protocol ProductCellProtocol where Self: UITableViewCell {
    func setProductName(_ product: String)
    func setProductQuantity(_ quantity: String)
    func setProductImage(_ productImage: UIImage?)
}

class ProductCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
}

extension ProductCell: ProductCellProtocol {
    func setProductName(_ product: String) {
        productNameLabel.text = product
    }
    
    func setProductQuantity(_ quantity: String) {
        quantityLabel.text = quantity
    }
    
    func setProductImage(_ productImage: UIImage?) {
        productImageView.image = productImage
    }    
}
