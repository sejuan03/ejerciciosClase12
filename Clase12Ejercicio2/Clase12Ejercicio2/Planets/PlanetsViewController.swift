//
//  PlanetsViewController.swift
//  Clase12Ejercicio2
//
//  Created by Mac on 5/01/23.
//

import UIKit

protocol PlanetsViewControllerProtocol: AnyObject {
    func navigateTowardsDetailView()
    func presentAlert()
}

class PlanetsViewController: UIViewController {
    private struct Constant {
        static let cellIdentifier = "PlanetCell"
        static let goToPlanetDetailView = "goToPlanetDetail"
        static let title = "FELICITACIONES!"
        static let message = "Todos los planetas fueron visitados"
        static let ok = "Gracias"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let brain: PlanetsBrainProtocol = PlanetsBrain()
    private var indexPlanetDetail = 0
    private var alertPlanetsReviewed: UIAlertController!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        brain.setViewController(self)
        createAlert()
    }
    
    private func createAlert() {
        alertPlanetsReviewed = UIAlertController(title: Constant.title, message: Constant.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constant.ok, style: .default) { action in
            self.tableView.reloadData()
        }
        alertPlanetsReviewed.addAction(okAction)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let planetDetailViewController = segue.destination as? PlanetDetailViewController else { return }
        planetDetailViewController.index = indexPlanetDetail
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if brain.validatePlanetsReviewed() {
            brain.resetPlanetsVisited()
            brain.presentAlert()
        }
    }
}

extension PlanetsViewController: PlanetsViewControllerProtocol {
    func navigateTowardsDetailView() {
        performSegue(withIdentifier: Constant.goToPlanetDetailView, sender: self)
    }
    
    func presentAlert() {
        present(alertPlanetsReviewed, animated: true)
    }
}

extension PlanetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brain.getNumberOfPlanets()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as! PlanetCell
        let planet = brain.getPlanet(with: indexPath.row)
        cell.setPlanetName(planet.name)
        cell.setPlanetSatelites(brain.setSatelitesFormat(planet.satelites))
        let planetImage = UIImage(named: planet.image)
        cell.setPlanetImage(planetImage)
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType != .checkmark {
            cell.accessoryType = .checkmark
            indexPlanetDetail = indexPath.row
            brain.updateNumberOfPlanetsReviewed()
            brain.navigateToPlanetDetail()
        }
    }
}
