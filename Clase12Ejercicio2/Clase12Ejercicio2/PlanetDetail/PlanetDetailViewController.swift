//
//  PlanetDetailViewController.swift
//  Clase12Ejercicio2
//
//  Created by Mac on 5/01/23.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    @IBOutlet weak var planetTitleLabel: UILabel!
    @IBOutlet weak var planetDescriptionLabel: UILabel!
    @IBOutlet weak var planetSatelitesLabel: UILabel!
    @IBOutlet weak var planetPeriodLabel: UILabel!
    @IBOutlet weak var planetDistanceLabel: UILabel!
    @IBOutlet weak var planetFirstImageView: UIImageView!
    @IBOutlet weak var planetSecondImageView: UIImageView!
    
    private let brain: PlanetDetailBrainProtocol = PlanetsBrain()
    private var planet: Planet!
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let index = index else {return}
        planet = brain.getPlanet(index)
        planetTitleLabel.text = planet.name
        planetDescriptionLabel.text = planet.description
        planetSatelitesLabel.text = "Satelites: \(planet.satelites)"
        planetPeriodLabel.text = "Periodo Orbital: \(planet.orbitalPeriod)"
        planetDistanceLabel.text = "Distancia al sol: \(planet.distance) millones Km"
        planetFirstImageView.image = UIImage(named: planet.image)
        planetSecondImageView.image = UIImage(named: planet.detailImage)
    }
    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: false)
    }
}
