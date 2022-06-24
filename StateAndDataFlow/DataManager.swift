//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Денис Вареников on 24.06.2022.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init(){}
    
    func userInformation() -> User {
        do {
            let user = try JSONDecoder().decode(User.self, from: userData ?? Data())
            return user
           }
        catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                return User()
              }
    }
    
    func updateUserInformation(user: User) {
        do {
            userData = try JSONEncoder().encode(user)
           }
        catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
              }
    }
    
    func exit(userManager: UserManager) {
        userData = nil
        userManager.user.name = ""
        userManager.user.isRegistered = false
    }
}
