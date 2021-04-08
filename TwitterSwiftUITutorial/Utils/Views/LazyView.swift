//
//  LazyView.swift
//  TwitterSwiftUITutorial
//
//  Created by Blake Wisniewski on 12/18/1399 AP.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
