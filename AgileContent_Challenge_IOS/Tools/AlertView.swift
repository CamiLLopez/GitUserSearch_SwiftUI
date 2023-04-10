//
//  AlertView.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 10/4/23.
//

import SwiftUI

struct AlertView: View {
    
    @State private var showingAlert = true
    @StateObject var viewModel: SearchUserViewModel

    var message: String
    
    var body: some View {
        VStack{
        Text("Error: \(message)")
                .alert(isPresented: $showingAlert)
            {
                Alert(title: Text("Error"),
                      message: Text(message),
                      dismissButton: .default(Text("OK")){
                    
                    showingAlert = false
                    viewModel.status = .none
                })
                
            }
            
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(viewModel: SearchUserViewModel(), message: "API Error")
    }
}
