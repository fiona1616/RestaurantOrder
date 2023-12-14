//
//  FoodListCell.swift
//  RestaurantOrder
//
//  Created by Fiona on 14/12/23.
//

import SwiftUI

struct FoodListCell: View {
    let food: Request
    @EnvironmentObject var orderData: OrderData
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: food.imageURL)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Image("foodPlaceholder").resizable().scaledToFill()
            }
            .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 6){
                Text(food.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Rp \(food.price)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            Spacer()
            VStack(alignment: .trailing){
                Spacer()
                getQuantity(foodName: food.name) == 0 ? Text("") :
                Text("\(getQuantity(foodName: food.name))x")
            }
        }
    }
    
    func getQuantity(foodName: String) -> Int{
        let data = orderData.order.filter{$0.food.name == foodName}
        if !data.isEmpty{
            return data.first?.quantity ?? 0
        }
        return 0
    }
}

#Preview {
    FoodListCell(food: Request(id: 2, name: "Shank", imageURL: "asd", price: 5000))
}
