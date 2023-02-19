//
//  ButtonNotification.swift
//  
//
//  Created by rrbox on 2022/11/15.
//

import Foundation

@objc public protocol ButtonResopnder {
    @objc func touchDownButton(notification: Notification)
    @objc func touchUpButton(notification: Notification)
}

public extension WidgetNotificationSystem {
    func touchDownButton(_ button: Button.Role) {
        self.post(name: .buttonTouchDown, object: nil, userInfo: ["buttonName": button])
    }
    
    func touchUpButton(_ button: Button.Role) {
        self.post(name: .buttonTouchUp, object: nil, userInfo: ["buttonName": button])
    }
    
    static func touchDownButton(_ button: Button.Role) {
        WidgetNotificationSystem.activated?.touchDownButton(button)
    }
    
    static func touchUpButton(_ button: Button.Role) {
        WidgetNotificationSystem.activated?.touchUpButton(button)
    }
}

extension Notification.Name {
    
    static let buttonTouchDown = Notification.Name("ButtonNode.touchDown")
    
    static let buttonTouchUp = Notification.Name("ButtonNode.touchUp")
    
}

public extension WidgetNotificationSystem {
    func add<T>(buttonObserver: T) -> WidgetNotificationSystem where T: ButtonResopnder {
        self.addObserver(buttonObserver, selector: #selector(buttonObserver.touchDownButton(notification:)), name: .buttonTouchDown, object: nil)
        self.addObserver(buttonObserver, selector: #selector(buttonObserver.touchUpButton(notification:)), name: .buttonTouchUp, object: nil)
        return self
    }
}

extension ButtonResopnder {
    
    public func getButtonEvent(_ notification: Notification) -> Button.Role {
        notification.userInfo!["buttonName"] as! Button.Role
    }
    
}
