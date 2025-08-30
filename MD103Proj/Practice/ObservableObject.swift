//
//  ObservableObject.swift
//  MD103
//
//  Created by Andrew Hershey on 8/28/25.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var name: String = "Andrew Hershey"
    @Published var age: Int = 27
}

struct MainView: View {
    @StateObject private var userModel = UserModel()
    
    var body: some View {
        VStack {
            ProfileView(user: userModel)
            EditProfileView(user: userModel)
        }
    }
}

struct ProfileView: View {
    @ObservedObject var user: UserModel
    
    var body: some View {
        VStack {
            Text("User Profile")
                .font(.headline)
            
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
        }
        .padding()
        .background(Color.blue.opacity(0.5))
    }
}

// EditProfileView
struct EditProfileView: View {
    @ObservedObject var user: UserModel
    
    var body: some View {
        VStack {
            Text("Edit Profile")
                .font(.headline)
            
            TextField("Enter your name", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Stepper("Age: \(user.age)", value: $user.age, in: 0...100)
        }
        .padding()
    }
}

#Preview {
    MainView()
}

