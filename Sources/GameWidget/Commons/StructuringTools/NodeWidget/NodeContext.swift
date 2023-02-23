//
//  NodeModifiers.swift
//  
//
//  Created by rrbox on 2022/10/30.
//

import CoreGraphics

public struct NodeContext: PositionContextProtocol,
                           RotatableContextProtocol,
                           ScalableContextProtocol,
                           ZPositionContextProtocol {
    
    public var position: CGPoint = .zero
    public var zRotation: CGFloat = .zero
    public var xScale: CGFloat = 1
    public var yScale: CGFloat = 1
    public var zPosition: CGFloat = .zero
    
    public init() {
        
    }
}
