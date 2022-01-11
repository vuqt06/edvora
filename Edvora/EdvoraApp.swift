//
//  EdvoraApp.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//

import SwiftUI

@main
struct EdvoraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ContentModel())
        }
    }
}
