//
//  TotalView.swift
//  RestaurantOrder
//
//  Created by Fiona on 15/12/23.
//

import SwiftUI

struct TotalView: View {
    @EnvironmentObject var orderData: OrderData
    
    var body: some View {
        HStack{
            Text("Total")
                .padding()
            Spacer()
            Text("Rp\(orderData.getTotal())")
                .padding()
        }
    }
}

#Preview {
    TotalView()
}
