//
//  SwiftUICell.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import SwiftUI

struct SwiftUICell: View {
    
    let viewModel: CellViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            Image(viewModel.bigLogo)
                .frame(width: 36, height: 36)
            
            VStack(spacing: 2) {
                topLine
                bottomLine
            }
        }
        .lineLimit(1)
        .frame(height: 60)
        .background(Color.white)
        .overlay(separator, alignment: .bottom)
        .padding(.horizontal, 16)
    }
    
    private var topLine: some View {
        HStack(spacing: 8) {
            Text(viewModel.topLeftText)
            Spacer()
            Image(viewModel.smallLogo)
                .frame(width: 18, height: 18)
            Text(viewModel.topRightText)
        }
    }
    
    private var bottomLine: some View {
        HStack(spacing: 0) {
            Text(viewModel.botLeftText)
            Spacer()
            Text(viewModel.botRightText)
        }
    }
    
    private var separator: some View {
        Rectangle()
            .fill(Color(UIColor.separator))
            .frame(height: 0.5)
    }
}
