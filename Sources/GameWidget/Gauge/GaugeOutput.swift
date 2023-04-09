//
//  GaugeOutput.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import Foundation

extension Notification.Name {
    static func gaugePostRate(id: Gauge.ID) -> Self {
        .init("gaugePostRate_\(id)")
    }
    static func gaugePostValue(id: Gauge.ID) -> Self {
        .init("gaugePostValue_\(id)")
    }
    static func gaugePostRateWithAnimation(id: Gauge.ID) -> Self {
        .init("gaugePostRateWithAnimation_\(id)")
    }
    static func gaugePostValueWithAnimation(id: Gauge.ID) -> Self {
        .init("gaugeValueWithAnimation_\(id)")
    }
}

public protocol GaugeDrawable: NotificationPublisher {
    
    func send(value: CGFloat, id: Gauge.ID)
    func send(rate: CGFloat, id: Gauge.ID)
    
    
}

public extension GaugeDrawable {
    func send(value: CGFloat, id: Gauge.ID) {
        self.notificationSystem?.post(name: .gaugePostValue(id: id), object: nil, userInfo: ["value": value])
    }
    func send(rate: CGFloat, id: Gauge.ID) {
        self.notificationSystem?.post(name: .gaugePostRate(id: id), object: nil, userInfo: ["rate": rate])
    }
    
    func sendForAnimation(value: CGFloat, id: Gauge.ID) {
        self.notificationSystem?.post(name: .gaugePostValueWithAnimation(id: id), object: nil, userInfo: ["value": value])
    }
    func sendForAnimation(rate: CGFloat, id: Gauge.ID) {
        self.notificationSystem?.post(name: .gaugePostRateWithAnimation(id: id), object: nil, userInfo: ["rate": rate])
    }
}
