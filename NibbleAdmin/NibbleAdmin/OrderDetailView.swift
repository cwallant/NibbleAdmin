//
//  OrderDetailView.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import SwiftUI

struct OrderDetailView: View {
    
    var order: Order
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header: Text("Customer")) {
                    
                    NavigationLink(destination: UserDetailView(order: order)) {
                        Text(order.customerName)
                            .font(.headline)
                    }
                }//End of Section
                
                Section(header: Text("Order Items")) {

                    ForEach(self.order.orderItems) { item in
                        
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$ \(item.price, specifier: "%.2f")")
                        }//End of HStack
                        
                    }//End of ForEach
                } //End of Section
                
                
                
            }//End of List
            
        }//End of Vstack
        .navigationBarTitle("Order", displayMode: .inline)
        .navigationBarItems(trailing:
        
            Button(action: {
                self.markAsCompleted()
            }, label: {
                Text("Complete Order")
            })
        )
    } //End of Body
    
    
    private func markAsCompleted() {
        
        if !order.isCompleted {
            order.isCompleted = true
            order.saveOrderToFirestore()
        }
    }
    
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order())
    }
}
