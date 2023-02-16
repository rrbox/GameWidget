//
//  WidgetPlugIns.swift
//  
//
//  Created by rrbox on 2023/02/16.
//

import SpriteKit


public protocol ContextPresentPlugIn {
    associatedtype Context: WidgetContextType
    associatedtype Node: SKNode
    func node(applying context: Context) -> Node
}
