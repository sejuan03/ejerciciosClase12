//
//  ProductsBrain.swift
//  Clase12Ejercicio1
//
//  Created by Mac on 3/01/23.
//

import Foundation

protocol ProductsBrainProtocol {
    func getNumberOfProducts() -> Int
    func getProduct(with index: Int) -> Product
}

class ProductsBrain {
    let productsStorage: ProductStorageProtocol = ProductStorage()
    
}

extension ProductsBrain: ProductsBrainProtocol {
    func getNumberOfProducts() -> Int {
        productsStorage.getNumberOfProducts()
    }
    
    func getProduct(with index: Int) -> Product {
        productsStorage.getProduct(with: index)
    }
}
