//
//  Hexagon.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path   = Path()
        let width  = rect.width
        let height = rect.height
        let x      = rect.midX
        let y      = rect.midY
        let sideLength   = min(width, height) / 2.0
        let vertOffset   = sideLength / 2.0              // sin 30 degrees = 0.5
        let horizOffset  = sideLength * sqrt(3.0) / 2.0  // cos 30 degrees = 0.866...

        path.move(to: CGPoint(x: x, y: y - sideLength))
        path.addLine(to: CGPoint(x: x + horizOffset, y: y - vertOffset))
        path.addLine(to: CGPoint(x: x + horizOffset, y: y + vertOffset))
        path.addLine(to: CGPoint(x: x, y: y + sideLength))
        path.addLine(to: CGPoint(x: x - horizOffset, y: y + vertOffset))
        path.addLine(to: CGPoint(x: x - horizOffset, y: y - vertOffset))
        path.closeSubpath()

        return path
    }
}
