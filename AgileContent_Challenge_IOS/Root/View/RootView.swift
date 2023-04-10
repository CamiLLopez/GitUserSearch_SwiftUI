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
        
        switch viewModel.status{
            
        case .none:
            SearchUserView(viewModel: viewModel)
        case .loading:
            Text("Loading")
            //SpinnerView()
        case .error(error: let errorSring):
            Text("Error Aqui \(errorSring)")
        case .ready:
            UserReposView(viewModel: viewModel)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(SearchUserViewModel())
        
    }
}
