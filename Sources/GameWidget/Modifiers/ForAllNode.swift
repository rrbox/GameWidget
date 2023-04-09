//
//  ForAllNode.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import CoreGraphics

public protocol PositionContextProtocol: ContextProtocol {
    var position: CGPoint { get set }
}

public struct Position<Context: PositionContextProtocol>: Modifier {
    var value: CGPoint
    
    public init(value: CGPoint) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.position = self.value
    }
    
}

public extension ModifiableWidget where Context: PositionContextProtocol {
    func position(_ value: CGPoint) -> Next<Position<Context>> {
        self.modifier(mod: .init(value: value))
    }
}

public protocol RotatableContextProtocol: ContextProtocol {
    var zRotation: CGFloat { get set }
    
}

public struct ZRotation<Context: RotatableContextProtocol>: Modifier {
    var value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.zRotation = self.value
    }
}

public extension ModifiableWidget where Context: RotatableContextProtocol {
    func zRotation(_ value: CGFloat) -> Next<ZRotation<Context>> {
        self.modifier(mod: .init(value: value))
    }
}

public protocol ScalableContextProtocol: ContextProtocol {
    var xScale: CGFloat { get set }
    var yScale: CGFloat { get set }
    
}

public struct Scale<Context: ScalableContextProtocol>: Modifier {
    var value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.xScale = self.value
        context.yScale = self.value
    }
}

public struct XScale<Context: ScalableContextProtocol>: Modifier {
    var value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.xScale = self.value
    }
}

public struct YScale<Context: ScalableContextProtocol>: Modifier {
    var value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.xScale = self.value
    }
}

public extension ModifiableWidget where Context: ScalableContextProtocol {
    func scale(_ value: CGFloat) -> Next<Scale<Context>> {
        self.modifier(mod: .init(value: value))
    }
    
    func xScale(_ value: CGFloat) -> Next<XScale<Context>> {
        self.modifier(mod: .init(value: value))
    }
    
    func yScale(_ value: CGFloat) -> Next<YScale<Context>> {
        self.modifier(mod: .init(value: value))
    }
}

public protocol ZPositionContextProtocol: ContextProtocol {
    var zPosition: CGFloat { get set }
}

public struct ZPosition<Context: ZPositionContextProtocol>: Modifier {
    var value: CGFloat
    public func mod(context: inout Context) {
        context.zPosition = self.value
    }
}

public extension ModifiableWidget where Context: ZPositionContextProtocol {
    func zPosition(_ value: CGFloat) -> Next<ZPosition<Context>> {
        self.modifier(mod: ZPosition(value: value))
    }
}

public protocol AlphaContextProtocol: ContextProtocol {
    var alpha: CGFloat { get set }
}

public struct Alpha<Context: AlphaContextProtocol>: Modifier {
    var value: CGFloat
    public func mod(context: inout Context) {
        context.alpha = self.value
    }
}

public extension ModifiableWidget where Context: AlphaContextProtocol {
    func alpha(_ value: CGFloat) -> Next<Alpha<Context>> {
        self.modifier(mod: Alpha(value: value))
    }
}
