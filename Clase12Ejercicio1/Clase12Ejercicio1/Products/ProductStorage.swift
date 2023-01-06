//
//  ProductStorage.swift
//  Clase12Ejercicio1
//
//  Created by Mac on 3/01/23.
//

import Foundation

protocol ProductStorageProtocol {
    func getNumberOfProducts() -> Int
    func getProduct(with index: Int) -> Product
}

class ProductStorage {
    private var products = [
        Product(name: "Televisor", image: "televisor", quantity: "14"),
        Product(name: "Celular", image: "celular", quantity: "24"),
        Product(name: "Impresora", image: "impresora", quantity: "3"),
        Product(name: "Reloj", image: "reloj", quantity: "14"),
        Product(name: "Camara", image: "camara", quantity: "15"),
        Product(name: "Computador", image: "computador", quantity: "16")
    ]
}

extension ProductStorage: ProductStorageProtocol {
    func getNumberOfProducts() -> Int {
        products.count
    }
    
    func getProduct(with index: Int) -> Product {
        products[index]
    }
    
}
