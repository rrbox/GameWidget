//
//  Modifier.swift
//  
//
//  Created by rrbox on 2022/10/22.
//

import Foundation


public protocol PositionContextProtocol: ContextProtocol {
    var position: CGPoint { get set }
}

public struct Position<Context: PositionContextProtocol>: Modifier {
    var value: CGPoint
    public func mod(context: inout Context) {
        context.position = self.value
    }
}

public extension ModifiableWidget where Context: PositionContextProtocol {
    func position(_ value: CGPoint) -> Next<Position<Context>> {
        self.modifier(mod: Position(value: value))
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

public typealias NodeWidget = RotatableItem & ScalableItem
