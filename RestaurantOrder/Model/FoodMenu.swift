//
//  FoodMenu.swift
//  RestaurantOrder
//
//  Created by Fiona on 14/12/23.
//

import Foundation

// MARK: - FoodMenu
struct FoodMenu: Codable,Identifiable {
    var id: Int
    let request: [Request]
}

// MARK: - Request
struct Request: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    let price: Int
}

struct Order: Codable{
    let food: Request
    var quantity: Int
}


class OrderData: ObservableObject{
    @Published var order: [Order]
    
    init(order: [Order]) {
        self.order = order
    }
}
