//
//  PieChartView.swift
//  PieChart
//
//  Created by Thongchai Subsaidee on 9/4/2564 BE.
//

import Charts
import SwiftUI

struct PieChart: UIViewRepresentable {
    
    let pieChart = PieChartView()
    var entries: [PieChartDataEntry]
    @Binding var category: Wine.Category
    
    func makeUIView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        return pieChart
    }

    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = [.red, .blue, .green]
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData
        
        configureChart(pieChart: uiView)
        formatCenter(pieChart: uiView)
        formatDescription(description: uiView.chartDescription)
        formatLegend(legend: uiView.legend)
        formatDataSet(dataSet: dataSet )
        uiView.notifyDataSetChanged()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        var parent: PieChart
        
        init(parent: PieChart) {
            self.parent = parent
        }
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let labelText = entry.value(forKey: "label") as! String
            let num = Int(entry.value(forKey: "value") as! Double)
            parent.pieChart.centerText = """
                    \(labelText)
                    \(num)
                """
        }
    }
    
    func configureChart(pieChart: PieChartView) {
        pieChart.rotationEnabled = false
        pieChart.animate(xAxisDuration: 0.5, easingOption: .easeOutCirc)
        pieChart.drawEntryLabelsEnabled = false
        pieChart.highlightValue(x: -1, dataSetIndex: 0, callDelegate: false)
    }
    
    func formatCenter(pieChart: PieChartView) {
        pieChart.holeColor = UIColor.systemBackground
        pieChart.centerText = category.rawValue.capitalized
        pieChart.centerTextRadiusPercent = 0.95
    }
    
    func formatDescription(description: Description) {
        description.text = category.rawValue.capitalized
        description.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func formatLegend(legend: Legend) {
        legend.enabled = false
    }
    
    func formatDataSet(dataSet: ChartDataSet) {
        dataSet.drawValuesEnabled = false
    }
}


