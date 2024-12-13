//
//  HomeViewModel.swift
//  nlw
//
//  Created by Carlos Eduardo Teixeira Silva on 2024-12-13.
//

import Foundation
import CoreLocation

class HomeViewModel {
    private let baseURL = "http://localhost:3333"
    var userLatitude = -23.561187293883442
    var userLongitude = -46.656451388116494
    var places: [Place] = []
    var filteredPlaces: [Place] = []
    
    var didUpdateCategories: (() -> Void)?
    var didUpdatePlaces: (() -> Void)?
    
    private func fethCategories(completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: baseURL + "/categories") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("deu ruim")
                return
            }
            
            guard let data else {
                completion([])
                return
            }
            
            
            do {
                let categories = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(categories)
                }
            } catch {
                print("Deu erro eo pegar as cateroias")
                completion([])
            }
        }.resume()
    }
    
    func fetchInitialData(completion: @escaping ([Category]) -> Void ) {
        fethCategories { categories in
            if let foodCategory = categories.first(where: { $0.name == "Alimentação" }) {
                self.fethPlaces(for: foodCategory.id, userLocation: CLLocationCoordinate2D(latitude: self.userLatitude, longitude: self.userLatitude))
            }
            
        }
    }
    
    private func fethPlaces(for categoryID: String, userLocation: CLLocationCoordinate2D) {
        guard let url = URL(string: baseURL + "/markets/category/\(categoryID)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print("deu ruim")
                return
            }
            
            guard let data else {
                return
            }
            
            
            do {
                self.places = try JSONDecoder().decode([Place].self, from: data)
                DispatchQueue.main.async {
                    self.didUpdatePlaces?()
                }
            } catch {
                print("Deu erro eo pegar as cateroias")
                
            }
        }.resume()
    }
  
}
