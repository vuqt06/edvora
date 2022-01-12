//
//  LoginView.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//

import SwiftUI

struct LoginView: View {
    var username:String?
    var body: some View {
        if username == nil {
            ProgressView()
        }
        else {
            Text("Welcome \(username!)!")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
