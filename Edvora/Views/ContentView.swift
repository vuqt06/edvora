//
//  ContentView.swift
//  Edvora
//
//  Created by Vu Trinh on 1/10/22.
//

import SwiftUI
extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

extension Color {
  init?(_ hex: String) {
    var str = hex
    if str.hasPrefix("#") {
      str.removeFirst()
    }
    if str.count == 3 {
      str = String(repeating: str[str.startIndex], count: 2)
        + String(repeating: str[str.index(str.startIndex, offsetBy: 1)], count: 2)
        + String(repeating: str[str.index(str.startIndex, offsetBy: 2)], count: 2)
    } else if !str.count.isMultiple(of: 2) || str.count > 8 {
      return nil
    }
    let scanner = Scanner(string: str)
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    if str.count == 2 {
      let gray = Double(Int(color) & 0xFF) / 255
      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
    } else if str.count == 4 {
      let gray = Double(Int(color >> 8) & 0x00FF) / 255
      let alpha = Double(Int(color) & 0x00FF) / 255
      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
    } else if str.count == 6 {
      let red = Double(Int(color >> 16) & 0x0000FF) / 255
      let green = Double(Int(color >> 8) & 0x0000FF) / 255
      let blue = Double(Int(color) & 0x0000FF) / 255
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    } else if str.count == 8 {
      let red = Double(Int(color >> 24) & 0x000000FF) / 255
      let green = Double(Int(color >> 16) & 0x000000FF) / 255
      let blue = Double(Int(color >> 8) & 0x000000FF) / 255
      let alpha = Double(Int(color) & 0x000000FF) / 255
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    } else {
      return nil
    }
  }
}

struct ContentView: View {
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
                    
                    HStack {
                        Spacer()
                        NavigationLink {
                            ForgotPasswordView()
                        } label: {
                            Text("Forgotten password?")
                                .accentColor(.brown)
                        }
                    }

                }.padding()
                Spacer()
                NavigationLink {
                    LoginView(username: model.username)
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("#733D47"))
                            .cornerRadius(10)
                            .frame(height:60)
                        Text("LOGIN")
                            .accentColor(.white)
                    }.padding()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign up")
                            .accentColor(.brown)
                    }

                    Spacer()
                }
                Spacer()

            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentModel())
    }
}
