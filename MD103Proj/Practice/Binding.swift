//
//  Binding.swift
//  MD103
//
//  Created by Andrew Hershey on 8/28/25.
//
import SwiftUI

struct NameView: View {
    
    @State var name: String = ""
    
    var body: some View {
        Form {
            Text("What is your name?")
            TextField("Name", text: $name)
                      
            Text("Your name is \(name)")
        }
    }
}

#Preview {
    NameView()
}
