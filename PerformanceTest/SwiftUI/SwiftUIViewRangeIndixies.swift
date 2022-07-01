//
//  SwiftUIViewRangeIndixies.swift
//  PerformanceTest
//
//  Created by akozlov on 24.06.2022.
//

import SwiftUI

struct SwiftUIViewRangeIndixies: View {
        
    var body: some View {
        GeometryReader { geometryProxy in
            TrackingScrollView(onContentOffsetChange: onChangeOffset) {
                LazyVStack {
                    ForEach(CellViewModel.exampleData.indices, id: \.self) { index in
                        SwiftUICell(viewModel: CellViewModel.exampleData[index]) {
                            print("ON TAP ACTION: \(CellViewModel.exampleData[index])")
                        }
                    }
                }
            }
            .environment(\.safeAreaInsets, geometryProxy.safeAreaInsets)
            .ignoresSafeArea(edges: .horizontal)
        }
    }
    
    private func onChangeOffset(_ point: CGPoint) {
        print("Content Offset: \(point)")
    }
}
