//
//  OrderListener.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import Foundation
import Firebase

class OrderListener: ObservableObject {
    
    @Published var activeOrders: [Order]!
    @Published var completedOrders: [Order]!

    
    init() {
        downloadOrder()
    }
    
    func downloadOrder() {
        
        FirebaseReference(collectionReference: .Order).addSnapshotListener { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                
                self.activeOrders = []
                self.completedOrders = []
                
                
                for order in snapshot.documents {
                    
                    let orderData = order.data()
                    
                    getItemsFromFirestore(withIds: orderData[oITEMIDS] as? [String] ?? []) { (allItems) in
                        
                        let order = Order()
                        order.customerId = orderData[oCUSTOMERID] as? String
                        order.id = orderData[oID] as? String
                        order.orderItems = allItems
                        order.amount = orderData[oAMOUNT] as? Double
                        order.customerName = orderData[oCUSTOMERNAME] as? String ?? ""
                        order.isCompleted = orderData[oISCOMPLETED] as? Bool ?? false
                        
                        if order.isCompleted {
                            self.completedOrders.append(order)
                        } else {
                            self.activeOrders.append(order)
                        }

                    }
                    
                }
            }
        }

    }
}


func getItemsFromFirestore(withIds: [String], completion: @escaping (_ itemArray: [Item]) -> Void) {
    
    var count = 0
    var itemArray: [Item] = []
    
    
    if withIds.count == 0 {
        completion(itemArray)
        return
    }
    
    for itemId in withIds {
        
        FirebaseReference(collectionReference: .Menu).whereField(kID, isEqualTo: itemId).getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                
                let itemData = snapshot.documents.first!
                
                itemArray.append(Item(id: itemData[iID] as? String ?? UUID().uuidString,
                                      restaurant: itemData[iRESTAURANT] as? String ?? "Unknown",
                                      name: itemData[iNAME] as? String ?? "Unknown",
                                      imageName: itemData[iIMAGENAME] as? String ?? "Unknown",
                                      category: Category(rawValue: itemData[iCATEGORY] as? String ?? "Food") ?? .food,
                                      description: itemData[iDESCRIPTION] as? String ?? "No Description Available",
                                      price: itemData[iPRICE] as? Double ?? 0.00,
                                      numberAvailable: itemData[iNUMBERAVAILABLE] as? Int ?? 0))
                
                count += 1
                
            } else {
                print("have no item")
                completion(itemArray)
            }
            
            
            if count == withIds.count {
                completion(itemArray)
            }
            
        }

    }
    
}
