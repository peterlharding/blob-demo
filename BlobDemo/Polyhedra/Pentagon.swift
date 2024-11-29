//
//  Pentagon.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI

// ---------------------------------------------------------------------------

struct Pentagon: Shape {

    func path(in rect: CGRect) -> Path {
        
        let numberOfSides = 5
        let sectionAngle = 2.0 * Double.pi / Double(numberOfSides)
        let internalAngle = (Double(numberOfSides) - 2.0) * Double.pi / Double(numberOfSides)
        
        var path   = Path()
        
        let width  = rect.width
        let height = rect.height
        
        let x      = rect.midX
        let y      = rect.midY
        
        let radius   = min(width, height) / 2.0
        
        print("                 radius |\(radius)|")
        print("          internalAngle |\(internalAngle)|")
        print("           sectionAngle |\(sectionAngle)|")
        
        let sideLength = radius * sin(sectionAngle/2) * 2
        let radialLength = radius * cos(sectionAngle/2)
        
        print("            side length |\(sideLength)|")
        
        let adjacentOffset  = sideLength * cos(internalAngle/2)
        let oppositeOffset  = sideLength * sin(internalAngle/2)
        
        print("         adjacentOffset |\(adjacentOffset)|")
        print("         oppositeOffset |\(oppositeOffset)|")
        

        path.move(to: CGPoint(x: x, y: y - radius))
        
        // First Quadrant
        
        path.addLine(to: CGPoint(x: x + oppositeOffset, y: y - radius + adjacentOffset))
    
        // Second Quadrant
        
        path.addLine(to: CGPoint(x: x + sideLength/2, y: y + radialLength))
     
        // Third Quadrant
        
        path.addLine(to: CGPoint(x: x - sideLength/2, y: y + radialLength))
 
        // Fourth Quadrant
        
        path.addLine(to: CGPoint(x: x - oppositeOffset, y: y - radius + adjacentOffset))
        
        path.closeSubpath()
        
        return path
    }
}

// ---------------------------------------------------------------------------
