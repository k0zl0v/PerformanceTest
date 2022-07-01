//
//  SwiftUIView.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import SwiftUI

struct SwiftUIViewIdentifiable: View {
    
    var body: some View {
        GeometryReader { geometryProxy in
            TrackingScrollView(onContentOffsetChange: onChangeOffset) {
                LazyVStack {
                    ForEach(CellViewModel.exampleData) { viewModel in
                        SwiftUICell(viewModel: viewModel) {
                            print("ON TAP ACTION: \(viewModel)")
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

