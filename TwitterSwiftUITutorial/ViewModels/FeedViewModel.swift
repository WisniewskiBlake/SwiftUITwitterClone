//
//  FeedViewModel.swift
//  TwitterSwiftUITutorial
//
//  Created by Stephen Dowless on 12/1/20.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
// ** Uncomment this function to fetch tweets as we did in course ** //
    
//    func fetchTweets() {
//        COLLECTION_TWEETS.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
//        }
//    }

// ** This function fetches tweets from people that the user follows ** //
    
    func fetchTweets() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_USERS.document(uid).collection("user-feed").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { document in
                COLLECTION_TWEETS.document(document.documentID).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    self.tweets.append(Tweet(dictionary: data))
                }
            }
        }
    }
}
