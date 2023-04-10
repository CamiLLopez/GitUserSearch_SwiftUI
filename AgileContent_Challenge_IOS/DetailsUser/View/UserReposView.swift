//
//  UserReposView.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 8/4/23.
//

import SwiftUI

struct UserReposView: View {
    
    @StateObject var viewModel: SearchUserViewModel
    
    
    var body: some View {
        
        VStack{
            
            Button {
                viewModel.status = .none
                RootView()
            } label: {
                Text("Back")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 320)
            }
           
            if let avatarImg = viewModel.user?.avatar_url,
               let username = viewModel.user?.login{
            AsyncImage(url: URL(string:"\(avatarImg)")){
                Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50)
                    .padding([.leading, .trailing], 50)
                    .frame(width:100, height: 100)
            }placeholder:{
                Text("Loading..")
            }
                Text("\(username)")
                    .font(.title2)
                    .opacity(0.8)
            }
           
            List{
                if let repos = viewModel.repos {
                    
                    ForEach(repos){ repo in
                        UserReposRowView(repo: repo)
                    }
                }
            }
        }
    }
}

struct UserReposView_Previews: PreviewProvider {
    static var previews: some View {
        UserReposView(viewModel: SearchUserViewModel())
    }
}
