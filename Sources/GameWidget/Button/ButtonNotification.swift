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

final public class ButtonNotificationCenter: NSObject {
    
    let center: NotificationCenter
    private static weak var activated: ButtonNotificationCenter?
    
    public override init() {
        self.center = NotificationCenter()
    }
    
    public func activate() {
        ButtonNotificationCenter.activated = self
    }
    
    func touchDownButton(_ button: Button.Role) {
        self.center.post(name: .buttonTouchDown, object: nil, userInfo: ["buttonName": button])
    }
    
    func touchUpButton(_ button: Button.Role) {
        self.center.post(name: .buttonTouchUp, object: nil, userInfo: ["buttonName": button])
    }
    
    static func touchDownButton(_ button: Button.Role) {
        ButtonNotificationCenter.activated?.touchDownButton(button)
    }
    
    static func touchUpButton(_ button: Button.Role) {
        ButtonNotificationCenter.activated?.touchUpButton(button)
    }
    
}

extension Notification.Name {
    
    static let buttonTouchDown = Notification.Name("ButtonNode.touchDown")
    
    static let buttonTouchUp = Notification.Name("ButtonNode.touchUp")
    
}

public extension ButtonResopnder {
    
    func getButtonEvent(_ notification: Notification) -> Button.Role {
        notification.userInfo!["buttonName"] as! Button.Role
    }
    
    func registerTo(_ system: ButtonNotificationCenter) {
        system.center.addObserver(self, selector: #selector(touchDownButton(notification:)), name: .buttonTouchDown, object: nil)
        system.center.addObserver(self, selector: #selector(touchUpButton(notification:)), name: .buttonTouchUp, object: nil)
    }
    
    func removeFrom(_ system: ButtonNotificationCenter) {
        system.center.removeObserver(self)
    }
    
}
