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
    
    var name: ID
    var position = CGPoint.zero
    var width = CGFloat(10)
    var length = CGFloat(100)
    var alignment = HorizontalBarChartAlignmentMode.right
    var backgroundColor = SKColor.gray
    
    @discardableResult public func width(_ value: CGFloat) -> Self {
        var result = self
        result.width = value
        return result
    }
    
    @discardableResult public func length(_ value: CGFloat) -> Self {
        var result = self
        result.length = value
        return result
    }
    
    @discardableResult public func arignment(_ value: HorizontalBarChartAlignmentMode) -> Self {
        var result = self
        result.alignment = value
        return result
    }
    
    @discardableResult public func position(_ value: CGPoint) -> Self {
        var result = self
        result.position = value
        return result
    }
    
    @discardableResult public func backgroundColor(_ value: SKColor) -> Self {
        var result = self
        result.backgroundColor = value
        return result
    }
    
}

extension HorizontalSingleBarChart: Widget {
    
    public func node() -> SKNode {
        let result = SKSpriteNode(color: self.backgroundColor, size: CGSize(width: self.length, height: self.width))
        result.anchorPoint = self.alignment.anchorPoint()
        result.position = self.position
        return result
    }
}
