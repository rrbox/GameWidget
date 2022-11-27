//
//  Modifier.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

public protocol Modifier {
    associatedtype Context: ContextProtocol
    func mod(context: inout Context)
}

