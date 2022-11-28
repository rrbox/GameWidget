//
//  BarChartNode.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import SpriteKit

class HorizontalBarChartNode: SKSpriteNode {
    static let center = NotificationCenter()
    var maxWidth: CGFloat = .zero
    
    @objc func receiveValue(notification: Notification) {
        self.size.width = (notification.userInfo?["value"] as! CGFloat)
    }
    
    @objc func receiveRate(notification: Notification) {
        self.size.width = (notification.userInfo?["rate"] as! CGFloat) * self.maxWidth
    }
    
    @objc func receiveValueWithAnimation(notification: Notification) {
        self.run(.resize(toWidth: (notification.userInfo?["value"] as! CGFloat), duration: 0.5))
    }
    
    @objc func receiveRateWithAnimation(notification: Notification) {
        self.run(.resize(toWidth: (notification.userInfo?["rate"] as! CGFloat) * self.maxWidth, duration: 0.5))
    }
    
    func registerTo(center: NotificationCenter, id: HorizontalSingleBarChart.ID) {
        center.addObserver(self, selector: #selector(receiveValue(notification:)), name: .barChartPostValue(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveRate(notification:)), name: .barChartPostRate(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveValueWithAnimation(notification:)), name: .barChartPostValueWithAnimation(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveRateWithAnimation(notification:)), name: .barChartPostRateWithAnimation(id: id), object: nil)
    }
}
