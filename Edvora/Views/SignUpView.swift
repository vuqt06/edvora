//
//  SignUpView.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        NavigationView {
            VStack {
                Image("edvora")
                Spacer()
                VStack(spacing: 15) {
                    InputBoxView(boxType: model.username, typingType: model.typingUsername, iconType: "person.fill", placeholderType: "Username")
                    
                    PasswordBoxView()
                    
                    InputBoxView(boxType: model.email, typingType: model.typingEmail, iconType: "at.circle", placeholderType: "Email address")
                    

                }.padding()
                Spacer()
                NavigationLink {
                    ProgressView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("#733D47"))
                            .cornerRadius(10)
                            .frame(height:60)
                        Text("SIGN UP")
                            .accentColor(.white)
                    }.padding()
                }
                Spacer()

            }.padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(ContentModel())
    }
}
