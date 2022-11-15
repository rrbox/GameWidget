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
    
    
//    @discardableResult public func width(_ value: CGFloat) -> Self {
//        var result = self
//        result.width = value
//        return result
//    }
//
//    @discardableResult public func length(_ value: CGFloat) -> Self {
//        var result = self
//        result.length = value
//        return result
//    }
//
//    @discardableResult public func arignment(_ value: HorizontalBarChartAlignmentMode) -> Self {
//        var result = self
//        result.alignment = value
//        return result
//    }
//
//    @discardableResult public func position(_ value: CGPoint) -> Self {
//        var result = self
//        result.position = value
//        return result
//    }
//
//    @discardableResult public func color(_ value: SKColor) -> Self {
//        var result = self
//        result.color = value
//        return result
//    }
//
//    @discardableResult public func backgroundColor(_ value: SKColor) -> Self {
//        var result = self
//        result.backgroundColor = value
//        return result
//    }
    
}

extension HorizontalSingleBarChart: Widget {
    public typealias Context = HorizontalSingleBarChartContext
    
    public func node(context: HorizontalSingleBarChartContext) -> SKNode {
        let result = SKSpriteNode(color: context.backgroundColor, size: CGSize(width: context.length, height: context.width))
        let bar = SKSpriteNode(color: context.color, size: CGSize(width: context.length, height: context.width))
        result.anchorPoint = context.alignment.anchorPoint()
        bar.anchorPoint = context.alignment.anchorPoint()
        result.position = context.position
        result.addChild(bar)
        return result
    }
    
}
