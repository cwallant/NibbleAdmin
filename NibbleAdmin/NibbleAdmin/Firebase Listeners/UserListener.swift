//
//  UserListener.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import Foundation
import Firebase

func downloadUser(userId: String, completion: @escaping(_ user: FUser?) -> Void) {
    
    FirebaseReference(collectionReference: .User).whereField(kID, isEqualTo: userId).getDocuments { (snapshot, error) in
        
        guard let snapshot = snapshot else { return }

        if !snapshot.isEmpty {
            
            let userData = snapshot.documents.first!.data()
            completion(FUser(userData as NSDictionary))
        } else {
            completion(nil)
        }
        
    }
}
