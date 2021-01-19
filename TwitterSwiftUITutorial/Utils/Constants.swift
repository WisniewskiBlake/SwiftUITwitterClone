//
//  Constants.swift
//  TwitterSwiftUITutorial
//
//  Created by Stephen Dowless on 11/30/20.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_TWEETS = Firestore.firestore().collection("tweets")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
