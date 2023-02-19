//
//  WidgetNotificationSystem.swift
//  
//
//  Created by rrbox on 2023/02/18.
//

import Foundation

final public class WidgetNotificationSystem: NotificationCenter {
    public static weak var activated: WidgetNotificationSystem?
    
    public func activate() {
        WidgetNotificationSystem.activated = self
    }
}
