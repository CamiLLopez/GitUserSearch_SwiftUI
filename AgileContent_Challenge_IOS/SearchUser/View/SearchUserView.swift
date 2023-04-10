//
//  SearchUserView.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 7/4/23.
//

import SwiftUI

struct SearchUserView: View {
    
    @StateObject var viewModel: SearchUserViewModel
    @State var usernameTextField: String = ""
    
    var body: some View {
        
        NavigationStack{
            
            TextField("Insert GitHub Username", text: $usernameTextField)
                .padding(10)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 3, x:3, y:3)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .frame(width: 350, height: 100)
            
            Button {
                viewModel.getGitHubUser(username: usernameTextField)
            } label: {
                Text("Search")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40)
                    .background(Color.blue)
                    .opacity(0.9)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
    }
}

struct SearchUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserView(viewModel: SearchUserViewModel())
    }
}
