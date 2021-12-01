//
//  Restaurant.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import Foundation
import SwiftUI

struct Restaurant: Identifiable, Hashable {
    var id: String
    var name: String
    var category: String
    var imageName: String
    var description: String
    var address: String
    var hours: String
}

func restaurantDictionaryFrom(restaurant:Restaurant) -> [String : Any] {
    
    
    return NSDictionary(objects: [restaurant.id,
                                  restaurant.name,
                                  restaurant.category,
                                  restaurant.imageName,
                                  restaurant.description,
                                  restaurant.address,
                                  restaurant.hours
                                  ],
                        forKeys: [
                                  rID as NSCopying,
                                  rNAME as NSCopying,
                                  rCATEGORY as NSCopying,
                                  rIMAGENAME as NSCopying,
                                  rDESCRIPTION as NSCopying,
                                  rADDRESS as NSCopying,
                                  rHOURS as NSCopying]
    ) as! [String : Any]
}

func createRestaurantList() {
    for restaurant in restaurantData {
        FirebaseReference(collectionReference: .RestaurantList).addDocument(data: restaurantDictionaryFrom(restaurant: restaurant))
    }
}

let restaurantData = [
    Restaurant(id: UUID().uuidString, name: "Olives", category: "Trending", imageName: "espresso", description: "This is an espresso", address: "1234 Street", hours: "9 am - 5 pm"),
    Restaurant(id: UUID().uuidString, name: "Tacoria", category: "Restaurants Nearby",imageName: "filter coffee", description: "the best filter coffee in town", address: "420 road", hours: "7 am - 10 pm"),
    Restaurant(id: UUID().uuidString, name: "Local Greek", category: "New Additions", imageName: "decaf", description: "the best decaf coffee in town", address: "420123 road", hours: "7 am - 11 pm"),
]


