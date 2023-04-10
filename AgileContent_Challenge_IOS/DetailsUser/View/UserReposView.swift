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
            } label: {
                Image(systemName: "chevron.backward")
                Text("Back")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 300)
            }
            
                if let avatarImg = viewModel.user?.avatar_url,
                   let username = viewModel.user?.login{
                    AsyncImage(url: URL(string:"\(avatarImg)")){
                        Image in
                        Image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(75)
                            .frame(width:150, height: 150)
                    }placeholder:{
                        Text("Loading..")
                    }
                    Text("\(username)")
                        .font(.headline)
                        .opacity(0.8)
                }
            
            List{
                if let repos = viewModel.repos {
                    
                    ForEach(repos){ repo in
                        UserReposRowView(repo: repo)
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, 70)            
        }
        .background(.regularMaterial)
        .padding(.bottom, 5)
    }
}

struct UserReposView_Previews: PreviewProvider {
    static var previews: some View {
        UserReposView(viewModel: SearchUserViewModel())
    }
}
