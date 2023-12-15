//
//  OrderSummaryCell.swift
//  RestaurantOrder
//
//  Created by Fiona on 15/12/23.
//

import SwiftUI

struct OrderSummaryCell: View {
    let order: Order
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("\(order.food.name)")
            HStack{
                Text("\(order.quantity)x")
                Text("Rp\(order.food.price)")
                Spacer()
                Text("Rp\(order.food.price * order.quantity)")
            }
        }
    }
}

#Preview {
    OrderSummaryCell(order: Order.dummyData)
}
