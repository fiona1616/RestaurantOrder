//
//  FoodDetailView.swift
//  RestaurantOrder
//
//  Created by Fiona on 14/12/23.
//

import SwiftUI

struct FoodDetailView: View {
    let food: Request
    @Binding var isShowingDetail: Bool
    @State private var quantity = 1
    @EnvironmentObject var orderData: OrderData
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: food.imageURL)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Image("foodPlaceholder").resizable().scaledToFill()
            }
            .cornerRadius(8)
            
            
            Text("\(food.name)")
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            
            HStack{
                Spacer()
                
                Button {
                    substract()
                } label: {
                    Text("-").font(.title)
                }
                
                Spacer()
                Text("\(quantity)")
                Spacer()
                
                Button {
                    add()
                } label: {
                    Text("+").font(.title)
                }
                
                Spacer()
            }.padding(.bottom, 8)
            
            Button {
                addOrderToCart(food: food, quantity: quantity)
                isShowingDetail = false
            } label: {
                Text("Rp\(food.price * quantity) - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding(.bottom, 16)
            
        }
        .frame(width: 300, height: 525)
        .background(Color.white)
        .cornerRadius(8, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .shadow(radius: 40)
        
        .overlay(
            Button(action: {
                isShowingDetail = false
            }, label: {
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .foregroundColor(.black)
                }
                .padding(8)
            }), alignment: .topTrailing
        )
        .onAppear{
            updateQuantity(foodName: food.name)
        }
    }
    
    func add(){
        quantity += 1
    }
    
    func substract(){
        if quantity != 1 {
            quantity -= 1
        }
    }
    
    func updateQuantity(foodName: String){
        quantity = getQuantityFromFood(foodName: foodName)
    }
    
    func addOrderToCart(food: Request, quantity: Int){
        if orderData.order.isEmpty{
            orderData.order.append(Order(food: food, quantity: quantity))
        }
        
        for i in 0..<orderData.order.count{
            if food.name == orderData.order[i].food.name{
                orderData.order[i].quantity = quantity
            }else{
                orderData.order.append(Order(food: food, quantity: quantity))
            }
        }
    }
    
    func getQuantityFromFood(foodName: String) -> Int{
        
        let data = orderData.order.filter{$0.food.name == foodName}
        
        if !data.isEmpty{
            return data.first?.quantity ?? 1
        }
        
        return 1
    }
    
    func isOrderInCart(foodName: String) -> Bool{
        let data = orderData.order.filter{$0.food.name == foodName}
        if data.isEmpty{
            return false
        }else{
            return true
        }
    }
}

#Preview {
    FoodDetailView(food: Request(id: 1, name: "Shanks adasd asdsad asasas asasas", imageURL: "https://www.themealdb.com/images/media/meals/sstssx1487349585.jpg", price: 50000), isShowingDetail: .constant(true))
}
