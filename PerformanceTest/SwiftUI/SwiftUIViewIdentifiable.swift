//
//  SwiftUIView.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import SwiftUI

struct SwiftUIViewIdentifiable: View {
        
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(CellViewModel.exampleData) { viewModel in
                    SwiftUICell(viewModel: viewModel)
                }
            }
        }
    }
}

