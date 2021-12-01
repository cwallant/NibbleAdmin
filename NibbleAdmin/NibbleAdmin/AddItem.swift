//
//  AddItem.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import SwiftUI
import Firebase

struct AddItem: View {
    @State var newItem:Item = Item(id: UUID().uuidString, restaurant: "Olives", name: "#6 Burrito", imageName: "frappe", category: Category.food, description: "BBB (Best Breakfast Burrito) - bacon, egg, and cheese on a white tortilla wrap with avocado and salsa verde", price: 1.50, numberAvailable: 10)
    @State var itemName = ""
    @State var itemDescription = ""
    @State var itemPrice = ""
    
    var body: some View {
        VStack {
            
            Text("Post an Item")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom, .top], 20)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Item Name")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                        .padding([.leading, .trailing], 50)
                        
                    
                    TextField("Enter item name", text: $itemName)
                        .padding([.leading, .trailing], 50)
                    Divider()
                        .padding([.leading, .trailing], 50)
                    
                    Text("Item Description")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                        .padding([.leading, .trailing], 50)
                    
                    TextField("Enter item price", text:$itemDescription)
                        .padding([.leading, .trailing], 50)
                    Divider()
                        .padding([.leading, .trailing], 50)
                    
                    Text("Item Price")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                        .padding([.leading, .trailing], 50)
                        .keyboardType(.decimalPad)
                    
                    TextField("Enter item price", text:$itemPrice)
                        .padding([.leading, .trailing], 50)
                    Divider()
                        .padding([.leading, .trailing], 50)
                    
                }
                .padding(.bottom, 15)
                //End of VStack
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        newItem.restaurant = "Olives"
                        newItem.name = itemName
                        newItem.description = itemDescription
                        newItem.price = Double(itemPrice)!
                        addMenuItem()
                    }, label: {
                        Text("Post Item")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding([.leading, .trailing], 50)
                    })
                }//End of HStack
                
            } .padding(.horizontal, 6)
            //End of VStack
        }//End of VStack
    }
    func addMenuItem() {
        FirebaseReference(collectionReference: .Menu).addDocument(data: itemDictionaryFrom(item: newItem))
        
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}
