//
//  Triangle.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI

// ---------------------------------------------------------------------------

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let degrees: Double = 30.0
 
        var path   = Path()
        
        let width  = rect.width
        let height = rect.height
        let x      = rect.midX
        let y      = rect.midY
        
        let sideLength   = min(width, height) // 2.0

        let adjacentLen: Double = sideLength * cos(degrees.degreesToRadians)
        let oppositeLen: Double = sideLength * sin(degrees.degreesToRadians)
        
        // let oppositeLen  = sideLength * sqrt(3.0) / 2.0  // cos 30 degrees = 0.866...
        
        path.move(to: CGPoint(x: x, y: y - CGFloat(adjacentLen/2)))
        path.addLine(to: CGPoint(x: x + oppositeLen, y: y + adjacentLen/2))
        path.addLine(to: CGPoint(x: x - oppositeLen, y: y + adjacentLen/2))
        path.closeSubpath()
        
        return path
    }
}

// ---------------------------------------------------------------------------
