//
//  ProductsViewController.swift
//  Clase12Ejercicio1
//
//  Created by Mac on 3/01/23.
//

import UIKit

class ProductsViewController: UIViewController {
    private struct Constant {
        static let cellIdentifier = "ProductCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let brain: ProductsBrainProtocol = ProductsBrain()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brain.getNumberOfProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as! ProductCell
        let product = brain.getProduct(with: indexPath.row)
        cell.setProductName(product.name)
        cell.setProductQuantity(product.quantity)
        let productImage = UIImage(named: product.image)
        cell.setProductImage(productImage)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType != .checkmark {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
