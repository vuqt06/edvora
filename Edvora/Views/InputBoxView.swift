//
//  InputBoxView.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//

import SwiftUI


struct InputBoxView: View {
    @State var boxType:String
    @State var typingType:Bool
    let iconType:String
    let placeholderType:String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("#F0F0F0"))
                .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(typingType ?  Color.brown : Color.white, lineWidth: 2))
            
            HStack() {
                Image(systemName: iconType)
                TextField(placeholderType, text: $boxType) {
                    startedEditing in
                    if startedEditing {
                        withAnimation {
                            typingType = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        typingType = false
                    }
                }.onTapGesture {
                    typingType.toggle()
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

struct InputBoxView_Previews: PreviewProvider {
    static var previews: some View {
        InputBoxView(boxType: "TheEdvorian", typingType: true, iconType: "person.fill", placeholderType: "Username")
    }
}
