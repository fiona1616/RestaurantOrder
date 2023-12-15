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
    @StateObject var tabSelectionManager = TabSelectionManager()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(orderData)
                .environmentObject(tabSelectionManager)
        }
    }
}

