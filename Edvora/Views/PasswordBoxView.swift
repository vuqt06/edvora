//
//  PasswordBoxView.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//

import SwiftUI

struct PasswordBoxView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("#F0F0F0"))
                .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(model.typingPassword ?  Color.brown : Color.white, lineWidth: 2))
                        .frame(height: 60)
            
            HStack() {
                Image(systemName: "key.fill")
                if model.secured {
                    SecureField("Password", text: $model.password, onCommit: {
                        withAnimation {
                            model.typingPassword = false
                        }
                    }).onTapGesture {
                        model.typingPassword.toggle()
                    }
                }
                else {
                    TextField("Password", text: $model.password) {
                        startedEditing in
                        if startedEditing {
                            withAnimation {
                                model.typingPassword = true
                            }
                        }
                    } onCommit: {
                        withAnimation {
                            model.typingPassword = false
                        }
                    }.onTapGesture {
                        model.typingPassword.toggle()
                    }
                }
                Button {
                    model.secured.toggle()
                } label: {
                    Image(systemName: model.secured ? "eye.slash" : "eye")
                        .foregroundColor(.brown)
                        .padding()
                }

                
            }
            .padding(.leading)
            .foregroundColor(.black)
        }.gesture(DragGesture()
                    .onChanged({ _ in
            UIApplication.shared.dismissKeyboard()
        }))

    }
}

struct PasswordBoxView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordBoxView().environmentObject(ContentModel())
    }
}
