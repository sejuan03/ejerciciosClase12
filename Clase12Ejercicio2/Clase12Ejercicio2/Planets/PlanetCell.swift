//
//  PlanetCell.swift
//  Clase12Ejercicio2
//
//  Created by Mac on 5/01/23.
//

import UIKit

protocol PlanetCellProtocol where Self: UITableViewCell {
    func setPlanetName(_ planet: String)
    func setPlanetSatelites(_ satelites: String)
    func setPlanetImage(_ planetImage: UIImage?)
}

class PlanetCell: UITableViewCell {
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var satelitesLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
}

extension PlanetCell: PlanetCellProtocol {
    func setPlanetName(_ planet: String) {
        planetNameLabel.text = planet
    }
    
    func setPlanetSatelites(_ satelites: String) {
        satelitesLabel.text = satelites
    }
    
    func setPlanetImage(_ planetImage: UIImage?) {
        planetImageView.image = planetImage
    }
}
