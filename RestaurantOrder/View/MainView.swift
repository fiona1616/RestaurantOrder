//
//  MainView.swift
//  RestaurantOrder
//
//  Created by Fiona on 15/12/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var tabSelectionManager = TabSelectionManager()

    var body: some View {
        TabView(selection: $tabSelectionManager.selectedTab) {
            // Tab 1
            FoodListView()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("Food List")
                }
            
            // Tab 2
            OrderSummaryView()
                .tabItem {
                    Image(systemName: "fork.knife.circle.fill")
                    Text("Order Summary")
                }
        }        
        .environmentObject(tabSelectionManager)
    }
}

#Preview {
    MainView()
}

