//
//  ContentView.swift
//  PieChart
//
//  Created by Thongchai Subsaidee on 9/4/2564 BE.
//

import Charts
import SwiftUI

struct ContentView: View {
    
    @State private var entries: [PieChartDataEntry] = []
    @State private var category: Wine.Category = .variety
    
    var body: some View {
        VStack {
            
            let entries = Wine.entriesForWines(wines: Wine.allWines, category: category)
            
            PieChart(entries: entries, category: $category)
                .frame(height: 400)
            
            Picker(selection: $category, label: Text("Category"), content: {
                Text("Variety")
                    .tag(Wine.Category.variety)
                Text("Winery")
                    .tag(Wine.Category.winery)
            })
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

