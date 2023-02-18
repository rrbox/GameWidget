//
//  WidgetNotificationSystem.swift
//  
//
//  Created by rrbox on 2023/02/18.
//

import Foundation

@objc public protocol WidgetObserver {
    func registerTo(_ system: WidgetNotificationSystem)
}

final public class WidgetNotificationSystem: NotificationCenter {
    public static weak var activated: WidgetNotificationSystem?
    
    public func activate() {
        WidgetNotificationSystem.activated = self
    }
    
    public func add(observer: some WidgetObserver) -> Self {
        observer.registerTo(self)
        return self
    }
}
