//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 01.11.2021.
//

import SwiftUI

struct RegisterView: View {
    //@State private var userName = ""
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            UserNameView(userName: $userManager.user.name, correctName: userManager.correctName)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
        .padding()
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            //user.name = userName
            userManager.user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

struct UserNameView: View {
    @Binding var userName: String
    var correctName = false
    
    var body: some View {
        HStack {
            TextField("Enter your name...", text: $userName)
                .multilineTextAlignment(.center)
            Text("\(userName.count)")
                .foregroundColor(correctName ? .green: .red)
        }
    }
}
