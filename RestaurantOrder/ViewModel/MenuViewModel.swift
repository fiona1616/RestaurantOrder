//
//  MenuViewModel.swift
//  RestaurantOrder
//
//  Created by Fiona on 14/12/23.
//

import Foundation


class MenuViewModel: ObservableObject{
    
    @Published var foods = [Request]()
    
    init(){
        loadJson()
    }
    
    func loadJson() {
        if let url = Bundle.main.url(forResource: "food", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FoodMenu.self, from: data)
                print(jsonData)
                self.foods = jsonData.request
            } catch {
                print("error:\(error)")
            }
        }else{
            print("file not found")
        }
    }
    
}
