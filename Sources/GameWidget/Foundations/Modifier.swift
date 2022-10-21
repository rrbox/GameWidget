//
//  Modifier.swift
//  
//
//  Created by rrbox on 2022/10/22.
//

import Foundation


protocol PositionContext {
    var position: CGPoint { get set }
}

struct Position<Context: PositionContext> {
    var value: CGPoint
    func mod(context: inout Context) {
        context.position = self.value
    }
}

protocol Modifier {
    associatedtype Context
    func mod(context: inout Context)
}

extension Position: Modifier {
    
}



extension Widget {
    func modifier<Mod: Modifier>(mod: Mod) -> Self {
        
    }
}
