//
//  GaugeModifiers.swift
//  
//
//  Created by rrbox on 2022/11/15.
//

import SpriteKit

public struct GaugeContext:
    PositionContextProtocol,
    ColorizableContextProtocol,
    AlphaContextProtocol,
    ZPositionContextProtocol {
    
    public init() {}
    
    public var position = CGPoint.zero
    public var color = SKColor.systemGreen
    public var alpha: CGFloat = 1
    public var zPosition: CGFloat = .zero
    var width = CGFloat(10)
    var length = CGFloat(100)
    var alignment = GaugeAlignmentMode.right
    var backgroundColor: SKColor?
}

public enum GaugeModiifers {
    public struct Width: Modifier {
        public typealias Context = GaugeContext
        var value: CGFloat
        
        public func mod(context: inout GaugeContext) {
            context.width = self.value
        }
    }
    
    public struct Length: Modifier {
        public typealias Context = GaugeContext
        var value: CGFloat
        
        public func mod(context: inout GaugeContext) {
            context.length = self.value
        }
    }
    
    public struct Alignment: Modifier {
        public typealias Context = GaugeContext
        var value: GaugeAlignmentMode
        
        public func mod(context: inout GaugeContext) {
            context.alignment = self.value
        }
    }
    
    public struct BackgroundColor: Modifier {
        public typealias Context = GaugeContext
        var value: SKColor
        
        public func mod(context: inout GaugeContext) {
            context.backgroundColor = self.value
        }
    }
}

public extension ModifiableWidget where Context == GaugeContext {
    func width(_ value: CGFloat) -> Next<GaugeModiifers.Width> {
        self.modifier(mod: GaugeModiifers.Width(value: value))
    }
    
    
    func length(_ value: CGFloat) -> Next<GaugeModiifers.Length> {
        self.modifier(mod: GaugeModiifers.Length(value: value))
    }
    
    func alignment(_ value: GaugeAlignmentMode) -> Next<GaugeModiifers.Alignment> {
        self.modifier(mod: GaugeModiifers.Alignment(value: value))
    }
    
    func backgroundColor(_ value: SKColor) -> Next<GaugeModiifers.BackgroundColor> {
        self.modifier(mod: GaugeModiifers.BackgroundColor(value: value))
    }
}
