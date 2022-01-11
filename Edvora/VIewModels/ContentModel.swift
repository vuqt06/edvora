//
//  ContentModel.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//

import Foundation
class ContentModel: ObservableObject {
    @Published var username:String
    @Published var typingUsername:Bool
    @Published var password:String
    @Published var typingPassword:Bool
    @Published var email:String
    @Published var typingEmail:Bool
    @Published var secured:Bool
    init() {
        self.username = "TheEdvorian"
        self.typingUsername = true
        self.password = ""
        self.typingPassword = false
        self.email = ""
        self.typingEmail = false
        self.secured = true
    }
}
