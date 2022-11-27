//
//  BarChartModifiers.swift
//  
//
//  Created by rrbox on 2022/11/15.
//

import SpriteKit

public struct HorizontalSingleBarChartContext: PositionContextProtocol, ColorizableContextProtocol {
    public init() {}
    
    public var position = CGPoint.zero
    public var color = SKColor.systemGreen
    var width = CGFloat(10)
    var length = CGFloat(100)
    var alignment = HorizontalBarChartAlignmentMode.right
    var backgroundColor = SKColor.gray
}

public enum HorizontalSingleBarChartModiifers {
    public struct Width: Modifier {
        public typealias Context = HorizontalSingleBarChartContext
        var value: CGFloat
        
        public func mod(context: inout HorizontalSingleBarChartContext) {
            context.width = self.value
        }
    }
    
    public struct Length: Modifier {
        public typealias Context = HorizontalSingleBarChartContext
        var value: CGFloat
        
        public func mod(context: inout HorizontalSingleBarChartContext) {
            context.length = self.value
        }
    }
    
    public struct Alignment: Modifier {
        public typealias Context = HorizontalSingleBarChartContext
        var value: HorizontalBarChartAlignmentMode
        
        public func mod(context: inout HorizontalSingleBarChartContext) {
            context.alignment = self.value
        }
    }
    
    public struct BackgroundColor: Modifier {
        public typealias Context = HorizontalSingleBarChartContext
        var value: SKColor
        
        public func mod(context: inout HorizontalSingleBarChartContext) {
            context.backgroundColor = self.value
        }
    }
}

public extension ModifiableWidget where Context == HorizontalSingleBarChartContext {
    func width(_ value: CGFloat) -> Next<HorizontalSingleBarChartModiifers.Width> {
        self.modifier(mod: HorizontalSingleBarChartModiifers.Width(value: value))
    }
    
    
    func length(_ value: CGFloat) -> Next<HorizontalSingleBarChartModiifers.Length> {
        self.modifier(mod: HorizontalSingleBarChartModiifers.Length(value: value))
    }
    
    func alignment(_ value: HorizontalBarChartAlignmentMode) -> Next<HorizontalSingleBarChartModiifers.Alignment> {
        self.modifier(mod: HorizontalSingleBarChartModiifers.Alignment(value: value))
    }
    
    func backgroundColor(_ value: SKColor) -> Next<HorizontalSingleBarChartModiifers.BackgroundColor> {
        self.modifier(mod: HorizontalSingleBarChartModiifers.BackgroundColor(value: value))
    }
}
