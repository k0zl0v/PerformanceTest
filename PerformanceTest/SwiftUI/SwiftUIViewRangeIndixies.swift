//
//  SwiftUIViewRangeIndixies.swift
//  PerformanceTest
//
//  Created by akozlov on 24.06.2022.
//

import SwiftUI

struct SwiftUIViewRangeIndixies: View {
        
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(CellViewModel.exampleData.indices, id: \.self) { index in
                    SwiftUICell(viewModel: CellViewModel.exampleData[index])
                }
            }
        }
    }
}
