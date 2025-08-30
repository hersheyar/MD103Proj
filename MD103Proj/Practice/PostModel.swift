//
//  PostModel.swift
//  MD103
//
//  Created by Andrew Hershey on 8/28/25.
//
//  PostModel.swift
//  MD103
//
//  Created by Andrew Hershey on 8/28/25.

import SwiftUI

class PostModel: ObservableObject {
    @Published var likeCount: Int
    @Published var caption: String
    @Published var username: String
    
    let imageName: String
    let date: String
    
    init(caption: String, imageName: String, date: String, username: String, likeCount: Int = 0) {
        self.caption = caption
        self.imageName = imageName
        self.date = date
        self.username = username
        self.likeCount = likeCount
    }
}

struct PostView: View {
    @ObservedObject var post: PostModel
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                Text(post.username)
                    .font(.headline)
            }
            .padding(.horizontal)

            Image(post.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            HStack {
                Button(action: { post.likeCount += 1 }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                Text("\(post.likeCount)")
            }
            .padding(.horizontal)
            
            HStack {
                if isEditing {
                    TextField("Edit caption", text: $post.caption)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    Text(post.caption)
                }
                Button(action: { isEditing.toggle() }) {
                    Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)

            Text(post.date)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
    }
}

#Preview {
    PostView(post: PostModel(
        caption: "I live where you vacation! #beach #LifeStyle ",
        imageName: "beach",
        date: "May 31",
        username: "andrew_h"
    ))
}

