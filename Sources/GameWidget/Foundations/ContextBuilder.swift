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

public extension ContextBuilder {
    func context() -> Mod.Context {
        var result = Mod.Context()
        self.mod(context: &result)
        return result
    }
    
}
