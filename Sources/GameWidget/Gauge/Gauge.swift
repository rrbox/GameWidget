//
//  BarChart.swift
//
//
//  Created by rrbox on 2022/06/07.
//

import SpriteKit

public enum HorizontalBarChartAlignmentMode {
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

public struct HorizontalSingleBarChart {
    
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

extension HorizontalSingleBarChart: Widget, ContextPresenter {
    public typealias Context = HorizontalSingleBarChartContext
    
    public func node(context: HorizontalSingleBarChartContext) -> SKNode {
        
        let bar = HorizontalBarChartNode(color: context.color, size: CGSize(width: context.length, height: context.width))
        
        bar.alpha = context.alpha
        bar.maxWidth = context.length
        bar.registerTo(center: HorizontalBarChartNode.center, id: self.name)
        bar.anchorPoint = context.alignment.anchorPoint()
        bar.position = context.position
        bar.zPosition = context.zPosition
        
        if let backgroundColor = context.backgroundColor {
            let backgound = SKSpriteNode(color: backgroundColor, size: CGSize(width: context.length, height: context.width))
            backgound.anchorPoint = context.alignment.anchorPoint()
            backgound.zPosition = context.zPosition - 0.01
            bar.addChild(backgound)
        }
        
        return bar
    }
    
}
