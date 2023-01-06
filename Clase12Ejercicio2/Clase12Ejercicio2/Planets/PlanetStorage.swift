//
//  PlanetStorage.swift
//  Clase12Ejercicio2
//
//  Created by Mac on 5/01/23.
//

import Foundation

protocol PlanetStorageProtocol {
    func getNumberOfPlanets() -> Int
    func getPlanetsForTable() -> [PlanetFilter]
    func getPlanet(_ index: Int) -> Planet
}

class PlanetStorage {
    private let planets = [
        Planet(name: "Mercurio", satelites: "0", image: "mercurio", description: "Mercurio es el planeta del sistema solar más cercano al Sol y el más pequeño. Forma parte de los denominados planetas interiores y carece de satélites naturales al igual que Venus.", detailImage: "sistemasolar", orbitalPeriod: "88 días", distance: "46.7"),
        Planet(name: "Venus", satelites: "0", image: "venus", description: "Venus es el segundo planeta del sistema solar en orden de proximidad al Sol y el tercero en cuanto a tamaño en orden ascendente después de Mercurio y Marte. Al igual que Mercurio, carece de satélites naturales.", detailImage: "sistemasolar", orbitalPeriod: "225 días", distance: "108"),
        Planet(name: "Tierra", satelites: "1", image: "tierra", description: "Nuestro hogar, el planeta Tierra, es un planeta terrestre y rocoso. Tiene una superficie sólida y activa, con montañas, valles, cañones, llanuras y mucho más. La Tierra es especial porque es un planeta océano, ya que el agua cubre el 70% de su superficie.", detailImage: "sistemasolar", orbitalPeriod: "365 días", distance: "147.1"),
        Planet(name: "Marte", satelites: "2", image: "marte", description: "Marte es el cuarto planeta en orden de distancia al Sol y el segundo más pequeño del sistema solar, después de Mercurio", detailImage: "sistemasolar", orbitalPeriod: "687 días", distance: "227.9"),
        Planet(name: "Jupiter", satelites: "79", image: "jupiter", description: "Júpiter es el planeta más grande del sistema solar y el quinto en orden de lejanía al Sol.​ Es un gigante gaseoso que forma parte de los denominados planetas exteriores. Recibe su nombre del dios romano Júpiter.", detailImage: "sistemasolar", orbitalPeriod: "12 años", distance: "778.5"),
        Planet(name: "Saturno", satelites: "53", image: "saturno", description: "Saturno es el sexto planeta del sistema solar contando desde el Sol, el segundo en tamaño y masa después de Júpiter y el único con un sistema de anillos visible desde la Tierra. Su nombre proviene del dios romano Saturno. Forma parte de los denominados planetas exteriores o gaseosos.", detailImage: "sistemasolar", orbitalPeriod: "29 años", distance: "1434"),
        Planet(name: "Urano", satelites: "27", image: "urano", description: "Urano es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo. Se llama así en honor de la divinidad griega del cielo Urano, el padre de Crono y el abuelo de Zeus.", detailImage: "sistemasolar", orbitalPeriod: "84 años", distance: "2871"),
        Planet(name: "Neptuno", satelites: "14", image: "neptuno", description: "Neptuno es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar. Forma parte de los denominados planetas exteriores, y dentro de estos, es uno de los gigantes helados, y es el primero que fue descubierto gracias a predicciones matemáticas.", detailImage: "sistemasolar", orbitalPeriod: "165 años", distance: "4495"),
        Planet(name: "Pluton", satelites: "5", image: "pluton", description: "Plutón, designado Pluto, es un planeta enano del sistema solar situado a continuación de la órbita de Neptuno. Su nombre se debe al dios mitológico romano Plutón.", detailImage: "sistemasolar", orbitalPeriod: "248 años", distance: "5916")
    ]
}

extension PlanetStorage: PlanetStorageProtocol {
    func getNumberOfPlanets() -> Int {
        planets.count
    }
    
    func getPlanet(_ index: Int) -> Planet {
        planets[index]
    }
    
    func getPlanetsForTable() -> [PlanetFilter] {
        var planetsFilter: [PlanetFilter] = []
        planets.forEach { planet in
            let planetFilter = PlanetFilter(name: planet.name, satelites: planet.satelites, image: planet.image)
            planetsFilter.append(planetFilter)
        }
        return planetsFilter
    }
}
