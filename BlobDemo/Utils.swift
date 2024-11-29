//
//  Utils.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import Foundation

func sumOfInteralAngles(ofSides n: Int) -> Double {
    Double(n - 2) * .pi
}

func internalAngle(ofSide n: Int) -> Double {
    .pi / Double(n)
}

func isRightAngle(_ angle: Double) -> Bool {
    angle.isNaN || angle.isInfinite || angle.truncatingRemainder(dividingBy: .pi) == .pi
}
