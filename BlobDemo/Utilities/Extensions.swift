//
//  Extensions.swift
//  BlobDemo
//
//  Created by plh on 2024-11-29.
//

import Foundation

extension BinaryInteger {
    var degreesToRadians: CGFloat { CGFloat(self) * .pi / 180 }
}

extension Double {
    var degreesToRadians: Self { self * .pi / 180.0 }
    var radiansToDegrees: Self { self * 180.0 / .pi }
}

