//
//  RootView.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 10/4/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var viewModel: SearchUserViewModel
    
    var body: some View {
        
        VStack{
                switch viewModel.status{
                    
                case .none:
                    SearchUserView(viewModel: viewModel)
                case .loading:
                    Text("Loading...")
                        .font(.title2)
                        .foregroundColor(.blue)
                case .error(error: let errorString):
                    AlertView(viewModel: viewModel, message: errorString)
                case .ready:
                    UserReposView(viewModel: viewModel)
                }
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(SearchUserViewModel())
        
    }
}
