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

public struct HorizontalSingleBarChartContext: ContextProtocol {
    var position = CGPoint.zero
    var width = CGFloat(10)
    var length = CGFloat(100)
    var alignment = HorizontalBarChartAlignmentMode.right
    var color = SKColor.systemGreen
    var backgroundColor = SKColor.gray
    
    public init() {}
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
    var context = HorizontalSingleBarChartContext()
    
    @discardableResult public func width(_ value: CGFloat) -> Self {
        var result = self
        result.context.width = value
        return result
    }
    
    @discardableResult public func length(_ value: CGFloat) -> Self {
        var result = self
        result.context.length = value
        return result
    }
    
    @discardableResult public func arignment(_ value: HorizontalBarChartAlignmentMode) -> Self {
        var result = self
        result.context.alignment = value
        return result
    }
    
    @discardableResult public func position(_ value: CGPoint) -> Self {
        var result = self
        result.context.position = value
        return result
    }
    
    @discardableResult public func color(_ value: SKColor) -> Self {
        var result = self
        result.context.color = value
        return result
    }
    
    @discardableResult public func backgroundColor(_ value: SKColor) -> Self {
        var result = self
        result.context.backgroundColor = value
        return result
    }
    
}

extension HorizontalSingleBarChart: Widget {
    public typealias Context = HorizontalSingleBarChartContext
    
    public func node(context: Context) -> SKNode {
        let result = SKSpriteNode(
            color: self.context.backgroundColor,
            size: CGSize(width: self.context.length, height: self.context.width))
        let bar = SKSpriteNode(
            color: self.context.color,
            size: CGSize(width: self.context.length, height: self.context.width))
        result.anchorPoint = self.context.alignment.anchorPoint()
        bar.anchorPoint = self.context.alignment.anchorPoint()
        result.position = self.context.position
        result.addChild(bar)
        return result
    }
}
