//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 06/01/23.
//

import SwiftUI

public protocol Route {}

public struct Router {

    public init() {}
    
    public func linkBuilder(destination: () -> some View, @ViewBuilder content: () -> some View) -> some View {
        return NavigationLink {
            destination()
        } label: {
            content()
        }

    }
}
