//
//  Octagon.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI



struct Octagon: Shape {
    // let noOfSides = 8
    // let internalAngle = Double.pi / 8

    func path(in rect: CGRect) -> Path {
        
        let sectionAngle = Double.pi/4
        let internalAngle = 6 * Double.pi/8
        
        var path   = Path()
        
        let width  = rect.width
        let height = rect.height
        
        let x      = rect.midX
        let y      = rect.midY
        
        let radius   = min(width, height) / 2.0
        
        print("         Octagon radius |\(radius)|")
        print("  Octagon internalAngle |\(internalAngle)|")

        let sideLength = radius * sin(sectionAngle/2) * 2
        
        print("    Octagon side length |\(sideLength)|")
        
        let adjacentOffset  = sideLength * cos(internalAngle/2)
        let oppositeOffset  = sideLength * sin(internalAngle/2)
        
        print(" Octagon adjacentOffset |\(adjacentOffset)|")
        print(" Octagon oppositeOffset |\(oppositeOffset)|")
        
        //    let vertOffset   = sideLength / 2.0              // sin 30 degrees = 0.5
        //    let horizOffset  = sideLength * sqrt(3.0) / 2.0  // cos 30 degrees = 0.866...
        //
        path.move(to: CGPoint(x: x, y: y - radius))
        
        // First Quadrant
        
        path.addLine(to: CGPoint(x: x + oppositeOffset, y: y - radius + adjacentOffset))
        path.addLine(to: CGPoint(x: x + radius, y: y))
        
        // Second Quadrant
        
        path.addLine(to: CGPoint(x: x + oppositeOffset, y: y + radius - adjacentOffset))
        path.addLine(to: CGPoint(x: x, y: y + radius))
        
        // Third Quadrant
        
        path.addLine(to: CGPoint(x: x - oppositeOffset, y: y + radius - adjacentOffset))
        path.addLine(to: CGPoint(x: x - radius, y: y))
        
        // Fourth Quadrant
        
        path.addLine(to: CGPoint(x: x - oppositeOffset, y: y - radius + adjacentOffset))
        
        path.closeSubpath()
        
        return path
    }
}
