//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//


import SpriteKit
import GameplayKit

public protocol Widget {
    func node() -> SKNode
    func addTo(parent list: inout [SKNode])
    
    associatedtype Context
}

public extension Widget {
    func addTo(parent list: inout [SKNode]) {
        list.append(self.node())
    }
}

public protocol MoveableItem: Widget {
    var position: CGPoint { get set }
}

public extension MoveableItem {
    func position(_ value: CGPoint) -> Self {
        var result = self
        result.position = value
        return result
    }
}

public protocol RotatableItem: Widget {
    var zRotation: CGFloat { get set }
}

public extension RotatableItem {
    func zRotation(_ value: CGFloat) -> Self {
        var result = self
        result.zRotation = value
        return result
    }
    
}

public protocol ScalableItem: Widget {
    var xScale: CGFloat { get set }
    var yScale: CGFloat { get set }
}

public extension ScalableItem {
    func scale(_ value: CGFloat) -> Self {
        var result = self
        result.xScale = value
        result.yScale = value
        return result
    }
    
    func xScale(_ value: CGFloat) -> Self {
        var result = self
        result.xScale = value
        return result
    }
    
    func yScale(_ value: CGFloat) -> Self {
        var result = self
        result.yScale = value
        return result
    }
    
}

public typealias NodeWidget = MoveableItem & RotatableItem & ScalableItem
