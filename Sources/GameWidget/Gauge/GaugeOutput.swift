//
//  GaugeOutput.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import Foundation

extension Notification.Name {
    static func barChartPostRate(id: HorizontalSingleBarChart.ID) -> Self {
        .init("barChartPostRate_\(id)")
    }
    static func barChartPostValue(id: HorizontalSingleBarChart.ID) -> Self {
        .init("barChartPostValue_\(id)")
    }
    static func barChartPostRateWithAnimation(id: HorizontalSingleBarChart.ID) -> Self {
        .init("barChartPostRateWithAnimation_\(id)")
    }
    static func barChartPostValueWithAnimation(id: HorizontalSingleBarChart.ID) -> Self {
        .init("barChartPostValueWithAnimation_\(id)")
    }
}

public protocol SingleBarChartDrawable {
    
    func send(value: CGFloat, id: HorizontalSingleBarChart.ID)
    func send(rate: CGFloat, id: HorizontalSingleBarChart.ID)
    
}

public extension SingleBarChartDrawable {
    func send(value: CGFloat, id: HorizontalSingleBarChart.ID) {
        HorizontalBarChartNode.center.post(name: .barChartPostValue(id: id), object: nil, userInfo: ["value": value])
    }
    func send(rate: CGFloat, id: HorizontalSingleBarChart.ID) {
        HorizontalBarChartNode.center.post(name: .barChartPostRate(id: id), object: nil, userInfo: ["rate": rate])
    }
    
    func sendForAnimation(value: CGFloat, id: HorizontalSingleBarChart.ID) {
        HorizontalBarChartNode.center.post(name: .barChartPostValueWithAnimation(id: id), object: nil, userInfo: ["value": value])
    }
    func sendForAnimation(rate: CGFloat, id: HorizontalSingleBarChart.ID) {
        HorizontalBarChartNode.center.post(name: .barChartPostRateWithAnimation(id: id), object: nil, userInfo: ["rate": rate])
    }
}
