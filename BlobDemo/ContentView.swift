//
//  ContentView.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI

// ---------------------------------------------------------------------------

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showBorder = true
    @State private var borderWidth: CGFloat = 2.0
    @State private var borderColor: Color = .black
    
    var body: some View {
        TabView {
            BlobView(color: .red)
                .border(showBorder ? .red : Color.clear, width: borderWidth)
                .tabItem {
                    Image(systemName: "1.circle")
                        .font(.title)
                }
                .tag(0)
            TriangleView(color: .orange)
                .border(showBorder ? .orange : Color.clear, width: borderWidth)
                .tabItem {
                    Image(systemName: "3.circle")
                }
                .tag(1)
            SquareView(color: .yellow)
                .border(showBorder ? .yellow : Color.clear, width: borderWidth)
                .tabItem {
                    Image(systemName: "4.circle")
                }
                .tag(2)
            PentagonView(color: .green)
                .border(showBorder ? .green : Color.clear, width: borderWidth)
                .tabItem {
                    Image(systemName: "5.circle")
                }
                .tag(3)
            OctagonView(color: .blue)
                .border(showBorder ? .blue : Color.clear, width: borderWidth)
                .tabItem {
                    Image(systemName: "8.circle")
                }
                .tag(4)
        }
            .ignoresSafeArea()
            .padding()
    }
}

// ---------------------------------------------------------------------------

#Preview {
    ContentView()
}
