//
//  Item.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Hashable {
    case food
    case drink
    case dessert
}

struct Item: Identifiable, Hashable {
    var id: String
    var restaurant: String
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var price: Double
    var numberAvailable: Int
}

func itemDictionaryFrom(item:Item) -> [String : Any] {
    
    
    return NSDictionary(objects: [item.id,
                                  item.name,
                                  item.imageName,
                                  item.category.rawValue,
                                  item.description,
                                  item.price,
                                  item.numberAvailable,
                                  item.restaurant],
                        forKeys: [
                                  iID as NSCopying,
                                  iNAME as NSCopying,
                                  iIMAGENAME as NSCopying,
                                  iCATEGORY as NSCopying,
                                  iDESCRIPTION as NSCopying,
                                  iPRICE as NSCopying,
                                  iNUMBERAVAILABLE as NSCopying,
                                  iRESTAURANT as NSCopying]
    ) as! [String : Any]
}

func addMenuItem() {
    for item in itemData {
        FirebaseReference(collectionReference: .Menu).addDocument(data: itemDictionaryFrom(item: item))
    }
}

let itemData = [
    // FOOD
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Espresso", imageName: "espresso", category: Category.food, description: "Espresso is the purest distillation of the coffee bean. It doesn’t refer to a bean or blend, but actually the preparation method.", price: 2.50, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Americano", imageName: "americano", category: Category.food, description: "An Americano Coffee is an Espresso-based coffee drink with no special additions. Actually it is a shot of Espresso with hot water poured in it. A well-prepared Americano has the subtle aroma and flavour like Espresso. Benefits of Americano Coffee it has a lighter body and less bitterness.", price: 2.00, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Cappuccino", imageName: "cappuccino", category: Category.food, description: "Outside of Italy, cappuccino is a coffee drink that today is typically composed of double espresso and hot milk, with the surface topped with foamed milk. Cappuccinos are most often prepared with an espresso machine.", price: 2.50, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Latte", imageName: "latte", category: Category.food, description: "A typical latte is made with six to eight ounces of steamed milk and one shot of espresso. Larger lattes are often made with a double shot of espresso.", price: 2.50, numberAvailable: 10),
        
                    
    // DRINK
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Filter Classic", imageName: "filter coffee", category: Category.drink, description: "Filter coffee brewing involves pouring hot water over coffee grounds. Gravity then pulls the water through the grounds, facilitating extraction, and dispenses it into a mug or carafe placed below.", price: 2.00, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Filter Decaf", imageName: "decaf", category: Category.drink, description: "Filter coffee brewing involves pouring hot water over coffee grounds. Gravity then pulls the water through the grounds, facilitating extraction, and dispenses it into a mug or carafe placed below.", price: 2.00, numberAvailable: 10),

    Item(id: UUID().uuidString, restaurant: "Olives", name: "Cold Brew", imageName: "cold brew", category: Category.drink, description: "Cold brew is really as simple as mixing ground coffee with cool water and steeping the mixture in the fridge overnight.", price: 2.50, numberAvailable: 10),

    Item(id: UUID().uuidString, restaurant: "Olives", name: "Cold Brew Latte", imageName: "brew latte", category: Category.drink, description: "To make a weaker brew, add 2 parts cold brew coffee to 1 part hot water. For a stronger brew, use a 4:1 ratio. Cold Brew Concentrate for Iced Lattes: use 3 ounces coffee beans per 2.5 cups of water.", price: 2.00, numberAvailable: 10),

    // DESSERT
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Frappe", imageName: "frappe", category: Category.dessert, description: "Frappé coffee is a Greek iced coffee drink made from instant coffee, water and sugar. Accidentally invented by a Nescafe representative in 1957 in Thessaloniki", price: 5.00, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Freddo Espresso", imageName: "freddo espresso", category: Category.dessert, description: "A Freddo Espresso is basically 1 shot of espresso poured hot into a metal canister. It's then mixed with an electric blender, using a couple of ice cubes, and sugar is also added during the mixing process.", price: 5.00, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Freddo Cappucciono", imageName: "freddo cappuccino", category: Category.dessert, description: "The Freddo Cappuccino is pretty much a Freddo Espresso with a lovely creamy foam layered on top, so if you prefer milk in your coffee, this one is for you!", price: 4.00, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Americano", imageName: "ice americano", category: Category.dessert, description: "An Americano Coffee is an Espresso-based coffee drink with no special additions. Actually it is a shot of Espresso with hot water poured in it. A well-prepared Americano has the subtle aroma and flavour like Espresso. Benefits of Americano Coffee it has a lighter body and less bitterness.", price: 2.00, numberAvailable: 10),
    
    Item(id: UUID().uuidString, restaurant: "Olives", name: "Iced Latte", imageName: "iced latte", category: Category.dessert, description: "The latte is one of the most iconic espresso drinks, favored for its frothy foam topping. In this refreshing iced version, you can easily create foam with cold milk—no steamer needed.", price: 2.50, numberAvailable: 10)
    
]

