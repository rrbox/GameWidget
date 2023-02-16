//
//  GaugeNode.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import SpriteKit

class GaugeNode: SKSpriteNode {
    static let center = NotificationCenter()
    var maxWidth: CGFloat = .zero
    
    @objc func receiveValue(notification: Notification) {
        self.removeAllActions()
        self.size.width = (notification.userInfo?["value"] as! CGFloat)
    }
    
    @objc func receiveRate(notification: Notification) {
        self.removeAllActions()
        self.size.width = (notification.userInfo?["rate"] as! CGFloat) * self.maxWidth
    }
    
    @objc func receiveValueWithAnimation(notification: Notification) {
        self.run(.resize(toWidth: (notification.userInfo?["value"] as! CGFloat), duration: 0.5))
    }
    
    @objc func receiveRateWithAnimation(notification: Notification) {
        self.run(.resize(toWidth: (notification.userInfo?["rate"] as! CGFloat) * self.maxWidth, duration: 0.5))
    }
    
    func registerTo(center: NotificationCenter, id: Gauge.ID) {
        center.addObserver(self, selector: #selector(receiveValue(notification:)), name: .gaugePostValue(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveRate(notification:)), name: .gaugePostRate(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveValueWithAnimation(notification:)), name: .gaugePostValueWithAnimation(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveRateWithAnimation(notification:)), name: .gaugePostRateWithAnimation(id: id), object: nil)
    }
}
