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
        self.size.width = (notification.userInfo?["value"] as! CGFloat) * self.maxWidth
    }
    
    @objc func receiveRate(notification: Notification) {
        self.size.width = (notification.userInfo?["rate"] as! CGFloat) * self.maxWidth
    }
    
    @objc func receiveWithAnimation(notification: Notification) {
        
    }
    
    func registerTo(center: NotificationCenter, id: HorizontalSingleBarChart.ID) {
        center.addObserver(self, selector: #selector(receiveValue(notification:)), name: .barChartPostValue(id: id), object: nil)
        center.addObserver(self, selector: #selector(receiveRate(notification:)), name: .barChartPostRate(id: id), object: nil)
    }
}
