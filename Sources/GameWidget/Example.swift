//
//  Example.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit
import SwiftUI

extension Button.Role {
    static let enter: Self = .init("ENTER")
    static let cancel: Self = .init("CANCEL")
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var scene: SKScene {
        let scene = SKScene(size: CGSize(width: 640, height: 640))
        
        scene.scaleMode = .aspectFit
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.addChild(
            Display()
                .place {
                    Button(.enter)
                        .size(CGSize(width: 96*4, height: 32))
                        .actionType(.alpha)
                        .color(.blue)
                    Button(.cancel)
                        .size(CGSize(width: 96, height: 32))
                        .position(CGPoint(x: 0, y: -33))
                    Button(.cancel)
                        .size(CGSize(width: 96, height: 32))
                        .position(CGPoint(x: 0, y: -66))
                }
                .place(item: {
                    HorizontalSingleBarChart(name: .init("a"))
                        .arignment(.left)
                        .length(200)
                        .width(20)
                        .position(.init(x: 0, y: -100))
                        .backgroundColor(.brown)
                })
                .node()
        )
        return scene
    }
    
    static var previews: some View {
        SpriteView(scene: scene)
            .frame(width: 640, height: 640, alignment: .center)
    }
    
}
