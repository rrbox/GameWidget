//
//  ContextBuilder.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

public protocol ContextBuilder {
    associatedtype Mod: Modifier
    
    var modData: Mod { get set }
    func mod(context: inout Mod.Context)
}
