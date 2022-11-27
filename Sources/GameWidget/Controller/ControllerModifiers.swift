//
//  ControllerModifiers.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import CoreGraphics

public struct ControllerContext: PositionContextProtocol,
                          ResizeableContextProtocol {
    public var position: CGPoint = .zero
    public var size: CGSize = CGSize(width: 100, height: 100)
    
    public init() {}
}
