//
//  Context.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

public protocol WidgetContextType {
    
}

public protocol ParameterLessGeneratable {
    init()
}

public protocol ContextProtocol: WidgetContextType, ParameterLessGeneratable {
    
}