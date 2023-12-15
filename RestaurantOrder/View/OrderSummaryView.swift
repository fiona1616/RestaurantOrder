//
//  OrderSummaryView.swift
//  RestaurantOrder
//
//  Created by Fiona on 15/12/23.
//

import SwiftUI

struct OrderSummaryView: View {
    @EnvironmentObject var orderData: OrderData
    @State private var showAlert = false // A boolean state to control the alert
    @EnvironmentObject var tabSelectionManager: TabSelectionManager

    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(orderData.order){ order in
                        OrderSummaryCell(order: order)
                    }
                    TotalView()
                    
                }
                .listStyle(GroupedListStyle())
                
                Button {
                    showAlert = true
                } label: {
                    Text("Order Now")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 260, height: 50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(12)
                }
                .padding(.vertical, 8)
                .disabled(!isItemInCart())
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Order Success"),
                        message: Text("Please wait your order."),
                        dismissButton: .default(Text("OK")) {
                            removeAllItem()
                            showAlert = false // Dismiss the alert
//                            tabSelectionManager.selectedTab = 0
                        }
                    )
                }
                
            }
            .navigationBarTitle("Order Summary", displayMode: .automatic)
        }
    }
    
    func removeAllItem(){
        orderData.order.removeAll()
    }
    
    func isItemInCart() -> Bool{
        return !orderData.order.isEmpty
    }
    
    
}

#Preview {
    OrderSummaryView()
}
