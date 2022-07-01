//
//  SwiftUICell.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import SwiftUI

struct SwiftUICell: View {
    
    let viewModel: CellViewModel
    let onTapAction: () -> Void
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    private var safeAreaPadding: EdgeInsets {
        return EdgeInsets(top: 0, leading: safeAreaInsets.leading, bottom: 0, trailing: safeAreaInsets.trailing)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(viewModel.bigLogo)
                .frame(width: 36, height: 36)
            
            VStack(spacing: 2) {
                topLine
                bottomLine
            }
            .padding(.trailing, 16)
            .frame(height: 60)
            .overlay(separator, alignment: .bottom)
        }
        .padding(.leading, 16)
        .padding(safeAreaPadding)
        .lineLimit(1)
        .allowsHitTesting(false)
        .background(
            // Button is placed here in order to improve table performance
            // since SwiftUI doesn't participate in button sizing in the background and hence not causing frame drops
            // https://jira.xtools.tv/browse/IOS-4316
            Button(action: onTapAction) {
                EmptyView()
            }
            .buttonStyle(SymbolSearchSelectionStyle())
            // Content shape is needed to fix button selection during back swipe gesture on iPad
            // https://jira.xtools.tv/browse/IOS-4010
            .contentShape(ButtonShape())
        )
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

// MARK: - ButtonShape
private extension SwiftUICell {
    
    struct ButtonShape: Shape {
        
        func path(in rect: CGRect) -> Path {
            return Path(rect.insetBy(dx: 16, dy: 0))
        }

    }
    
}

// MARK: - SymbolSearchSelectionStyle
private extension SwiftUICell {
    
    struct SymbolSearchSelectionStyle: ButtonStyle {
        
        func makeBody(configuration: Self.Configuration) -> some View {
            Color(configuration.isPressed ? .lightGray : .white)
        }
        
    }
    
}
