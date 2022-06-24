//
//  SwiftUIView.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import SwiftUI

struct SwiftUIView: View {
        
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
