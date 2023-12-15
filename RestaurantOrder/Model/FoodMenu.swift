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

struct Order: Codable, Identifiable{
    var id = UUID() // Provide a unique identifier for each Order
    let food: Request
    var quantity: Int
    
    static let dummyData = Order(food: Request(id: 1, name: "buffalo", imageURL: "asd", price: 5000), quantity: 3)
}


class OrderData: ObservableObject{
    @Published var order: [Order]
    
    init(order: [Order]) {
        self.order = order
    }
    
    func getTotal() -> Int {
        return order.reduce(0) { $0 + ($1.quantity * $1.food.price) }
    }
}
