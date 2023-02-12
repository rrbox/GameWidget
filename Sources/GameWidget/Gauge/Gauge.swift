//
//  Gauge.swift
//
//
//  Created by rrbox on 2022/06/07.
//

import SpriteKit

public enum GaugeAlignmentMode {
    case left, right, center
    static let anchorPointMap: [Self: CGPoint] = [
        .left: CGPoint(x: 0, y: 0.5),
        .center: CGPoint(x: 0.5, y: 0.5),
        .right: CGPoint(x: 1, y: 0.5)
    ]
    func anchorPoint() -> CGPoint {
        Self.anchorPointMap[self]!
    }
}

public struct Gauge {
    
    public struct ID: Equatable {
        let id: String
        public init(_ id: String) {
            self.id = id
        }
    }
    
    public init(name: ID) {
        self.name = name
    }
    
    var name: ID
    
}

extension Gauge: Widget, ContextPresenter {
    public typealias Context = GaugeContext
    
    public func node(context: GaugeContext) -> SKNode {
        
        let gauge = GaugeNode(color: context.color, size: CGSize(width: context.length, height: context.width))
        
        gauge.alpha = context.alpha
        gauge.maxWidth = context.length
        gauge.registerTo(center: GaugeNode.center, id: self.name)
        gauge.anchorPoint = context.alignment.anchorPoint()
        gauge.position = context.position
        gauge.zPosition = context.zPosition
        
        if let backgroundColor = context.backgroundColor {
            let backgound = SKSpriteNode(color: backgroundColor, size: CGSize(width: context.length, height: context.width))
            backgound.anchorPoint = context.alignment.anchorPoint()
            backgound.zPosition = context.zPosition - 0.01
            gauge.addChild(backgound)
        }
        
        return gauge
    }
    
}
