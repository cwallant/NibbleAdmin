//
//  UserDetailView.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import SwiftUI

struct UserDetailView: View {
    
    var order: Order
    @State var user: FUser?
    
    
    var body: some View {
        
        List {
            
            Section {
                Text(user?.fullName ?? "")
                Text(user?.email ?? "")
                Text(user?.phoneNumber ?? "")
                
            }//End of Section
            
        }//End of list
        .listStyle(GroupedListStyle())
        .navigationBarTitle("User Profile")
        .onAppear {
            self.getUser()
        }
    }
    
    private func getUser() {
        
        downloadUser(userId: self.order.customerId) { (fuser) in
            
            self.user = fuser
        }
    }
    
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(order: Order())
    }
}
