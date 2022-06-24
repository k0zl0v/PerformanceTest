//
//  CellViewModel.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import Foundation


struct CellViewModel: Hashable, Identifiable {
    
    let id = UUID()
    
    let bigLogo: String
    let smallLogo: String
    
    let topLeftText: String
    let topRightText: String
    let botLeftText: String
    let botRightText: String
    
    static let exampleData: [CellViewModel] = (0...3000).map { index in
        CellViewModel(
            bigLogo: "image36",
            smallLogo: "image18",
            topLeftText: "topLeftText: \(index)",
            topRightText: "topRightText: \(index)",
            botLeftText: "botLeftText: \(index)",
            botRightText: "botRightText: \(index)"
        )
    }
}
