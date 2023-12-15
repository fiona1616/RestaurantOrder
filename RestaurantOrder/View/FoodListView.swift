//
//  ContentView.swift
//  RestaurantOrder
//
//  Created by Fiona on 14/12/23.
//

import SwiftUI

struct FoodListView: View {
    @ObservedObject var datas = MenuViewModel()
    @State private var isShowingDetail = false
    @State private var selectedFood: Request?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(datas.foods){ food in
                    FoodListCell(food: food)
                        .onTapGesture {
                            isShowingDetail = true
                            selectedFood = food
                        }
                }
                .navigationTitle("🥘 Food Mania")
            }
            .blur(radius: isShowingDetail ? 15 : 0)
            
            if isShowingDetail{
                FoodDetailView(food: selectedFood!, isShowingDetail: $isShowingDetail)
            }
            
        }
    }
}

#Preview {
    FoodListView()
}
