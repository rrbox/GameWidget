//
//  Notification.swift
//  
//
//  Created by rrbox on 2023/02/05.
//

import Foundation

final public class GWNotificationCenter: NSObject {
    
    let center: NotificationCenter
    private static weak var activated: GWNotificationCenter?
    
    public override init() {
        self.center = NotificationCenter()
    }
    
    public func activate() {
        GWNotificationCenter.activated = self
    }
    
}

class App {
    func addObserver() {
        
    }
}
