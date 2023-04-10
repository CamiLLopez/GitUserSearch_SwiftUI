//
//  AgileContent_Challenge_IOSApp.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 5/4/23.
//

import SwiftUI

@main
struct AgileContent_Challenge_IOSApp: App {

    @StateObject var viewModel = SearchUserViewModel()
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(viewModel)
        }
    }
}
