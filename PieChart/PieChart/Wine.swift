//
//  Wine.swift
//  PieChart
//
//  Created by Thongchai Subsaidee on 9/4/2564 BE.
//

import Charts
import Foundation

struct Wine {
    
    enum Category: String {
        case variety, winery
    }
    
    var category: Category
    var value: Double
    var label: String
    
    static var allWines: [Wine] {
        return [
            Wine(category: .variety, value: 6, label: "Chardonnay"),
            Wine(category: .variety, value: 2, label: "Merlot"),
            Wine(category: .variety, value: 5, label: "Pinot Gris"),
            Wine(category: .variety, value: 7, label: "Gewriztramner"),
            Wine(category: .variety, value: 12, label: "Red Blend"),
            Wine(category: .variety, value: 10, label: "White Blend"),
            
            Wine(category: .winery, value: 30, label: "Chardonnay2"),
            Wine(category: .winery, value: 12, label: "Merlot2"),
            Wine(category: .winery, value: 35, label: "Pinot Gris2"),
            Wine(category: .winery, value: 70, label: "Gewriztramner2"),
            Wine(category: .winery, value: 15, label: "Red Blend2"),
            Wine(category: .winery, value: 27, label: "White Blend2"),
        ]
    }
    
    static func entriesForWines(wines: [Wine], category: Category) -> [PieChartDataEntry] {
        let requestedWines = wines.filter({$0.category == category})
        return requestedWines.map({PieChartDataEntry(value: $0.value, label: $0.label)})
    }
    
}
