//
//  OctagonView.swift
//  BlobDemo
//
//  Created by Peter Harding on 29/11/2024.
//

import SwiftUI

struct OctagonView: View {
    @State var position: CGPoint = .zero
    let color: Color
    
    var body: some View {
        
        GeometryReader { proxy in
            let proxyWidth = proxy.size.width * 0.5
            let proxyHeight = proxy.size.height * 0.5
            
            
            Canvas { context, size in
                print()
                print("        size |\(size)|")
                print("    position |\(position)|")
                print("  proxyWidth |\(proxyWidth)|")
                print(" proxyHeight |\(proxyHeight)|")
                print()
                
                context.addFilter(.alphaThreshold(min: 0.8,
                                                  color: color))
                context.addFilter(.blur(radius: 5))
                
                context.drawLayer { ctx in
                    ctx.fill(Octagon()
                        .path(in: .init(x: proxyWidth + position.x - 50,
                                        y: proxyHeight + position.y - 200,
                                        width: 120,
                                        height: 120)), with: .foreground)
                    ctx.fill(Octagon()
                        .path(in: .init(x: proxyWidth - 150,
                                        y: proxyHeight - 300,
                                        width: 300,
                                        height: 300)), with: .foreground)
                }
            }
            .gesture(DragGesture()
                .onChanged { gesture in
                    position = .init(x: gesture.translation.width,
                                     y: gesture.translation.height)
                }
            )
        }
    }
}

#Preview {
    OctagonView(color: .yellow)
}
