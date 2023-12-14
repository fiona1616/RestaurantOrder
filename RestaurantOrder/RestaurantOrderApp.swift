//
//  RestaurantOrderApp.swift
//  RestaurantOrder
//
//  Created by Fiona on 14/12/23.
//

import SwiftUI

@main
struct RestaurantOrderApp: App {
    let orderData = OrderData(order: [])
    var body: some Scene {
        WindowGroup {
            FoodListView()
                .environmentObject(orderData)
        }
    }
}

