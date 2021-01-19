//
//  SideMenuHeaderView.swift
//  TwitterSwiftUITutorial
//
//  Created by Stephen Dowless on 12/22/20.
//

import SwiftUI
import KingfisherSwiftUI

struct SideMenuHeaderView: View {
    private let user = AuthViewModel.shared.user
    @Binding var show: Bool
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Button(action: {
                withAnimation(.spring()){
                    self.show.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 24))
                    .scaledToFill()
                    .foregroundColor(.black)
                    .shadow(color: .gray, radius: 10, x: 0, y: 0)
            }.padding()
            
            VStack(alignment: .leading) {
                KFImage(URL(string: user?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                Text(user?.fullname ?? "")
                    .font(.system(size: 16, weight: .semibold))
                
                Text("@\(user?.username ?? "")")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(.bottom)
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Text("2").bold()
                        Text("Following")
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 4) {
                        Text("0").bold()
                        Text("Followers")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(show: .constant(false))
    }
}