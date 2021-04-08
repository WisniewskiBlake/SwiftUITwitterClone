//
//  NotificationsView.swift
//  TwitterSwiftUITutorial
//
//  Created by Blake Wisniewski on 12/18/1399 AP.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
                }
            }.padding()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
