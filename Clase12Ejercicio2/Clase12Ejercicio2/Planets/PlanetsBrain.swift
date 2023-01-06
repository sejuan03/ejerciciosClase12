//
//  PlanetsBrain.swift
//  Clase12Ejercicio2
//
//  Created by Mac on 5/01/23.
//

protocol PlanetsBrainProtocol {
    func setViewController(_ viewController: PlanetsViewControllerProtocol)
    func getNumberOfPlanets() -> Int
    func getPlanet(with index: Int) -> PlanetFilter
    func setSatelitesFormat(_ satelites: String) -> String
    func updateNumberOfPlanetsReviewed()
    func validatePlanetsReviewed() -> Bool
    func navigateToPlanetDetail()
    func resetPlanetsVisited()
    func presentAlert()
}

protocol PlanetDetailBrainProtocol {
    func getPlanet(_ index: Int) -> Planet
}

class PlanetsBrain {
    private struct Constant {
        static let satelites = "Satelites:"
    }
    
    private let planetStorage: PlanetStorageProtocol = PlanetStorage()
    private weak var viewController: PlanetsViewControllerProtocol?
    
    private var planetsVisited = 0
}

extension PlanetsBrain: PlanetsBrainProtocol {
    func setViewController(_ viewController: PlanetsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func getNumberOfPlanets() -> Int {
        planetStorage.getNumberOfPlanets()
    }
    
    func getPlanet(with index: Int) -> PlanetFilter {
        planetStorage.getPlanetsForTable()[index]
    }
    
    func setSatelitesFormat(_ satelites: String) -> String {
        "\(Constant.satelites) \(satelites)"
    }
    
    func updateNumberOfPlanetsReviewed() {
        planetsVisited += 1
    }
    
    func validatePlanetsReviewed() -> Bool {
        planetsVisited == planetStorage.getNumberOfPlanets()
    }
    
    func navigateToPlanetDetail() {
        guard let viewController = viewController else { return }
        viewController.navigateTowardsDetailView()
    }
    
    func resetPlanetsVisited() {
        planetsVisited = 0
    }
    
    func presentAlert() {
        guard let viewController = viewController else { return }
        viewController.presentAlert()
    }
}

extension PlanetsBrain: PlanetDetailBrainProtocol {
    func getPlanet(_ index: Int) -> Planet {
        planetStorage.getPlanet(index)
    }
}

