//
//  BlobDemoApp.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI

// ---------------------------------------------------------------------------

@main
struct BlobDemoApp: App {
    
    init() {
        customizeTabBarWithOpaqueBackground()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


// ---------------------------------------------------------------------------
// This does not work!

func customizeTabBarWithBevel() {
    
    // Apply basic tab bar customization
    let appearance = UITabBarAppearance()
    
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.systemBackground

    UITabBar.appearance().standardAppearance = appearance
    
    if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    // Add a bevel effect
    UITabBar.appearance().layer.borderColor = UIColor.gray.cgColor
    UITabBar.appearance().layer.borderWidth = 1
    UITabBar.appearance().layer.shadowColor = UIColor.black.cgColor
    UITabBar.appearance().layer.shadowOffset = CGSize(width: 0, height: -2)
    UITabBar.appearance().layer.shadowRadius = 3
    UITabBar.appearance().layer.shadowOpacity = 0.2
}

// ---------------------------------------------------------------------------

func customizeTabBarWithOpaqueBackground() {
    
    let appearance = UITabBarAppearance()
    
    appearance.configureWithOpaqueBackground()
    
    appearance.backgroundColor = UIColor.systemFill // Set Tab Bar background color

    // Set the normal state attributes
    let normalAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.gray,
        .font: UIFont.systemFont(ofSize: 12)
    ]
    appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes

    // Set the selected state attributes
    let selectedAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.systemBlue,
        .font: UIFont.boldSystemFont(ofSize: 12)
    ]
    appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes

    // Apply the appearance to UITabBar
    UITabBar.appearance().standardAppearance = appearance
    if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

// ---------------------------------------------------------------------------

