//
//  ContentView.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListener = OrderListener()
    @State private var showingPostItem = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                Section(header: Text("Active Orders")) {
                    
                    ForEach(self.orderListener.activeOrders ?? []) { order in
                        
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            
                            HStack {
                                Text(order.customerName)
                                Spacer()
                                Text("$\(order.amount, specifier: "%.2f")")
                            }//End of HStack

                        }//End of Navigation link
                        
                    }//End of for each
                }//End of Section
                
                
                Section(header: Text("Completed Orders")) {
                    ForEach(self.orderListener.completedOrders ?? []) { order in
                        
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            HStack {
                                Text(order.customerName)
                                Spacer()
                                Text("$\(order.amount, specifier: "%.2f")")
                            }//End of HStack
                        }//End of Navigation link
                        
                    }//End of for each
                    
                }//End of Section
                
                
            }//End of list
            .navigationBarTitle("Orders")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingPostItem.toggle()
                }, label: {
                    Text("Post Item")
                })
            )
            .sheet(isPresented: $showingPostItem) {
                AddItem()
        }
            
        }//End of Navigation view
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
