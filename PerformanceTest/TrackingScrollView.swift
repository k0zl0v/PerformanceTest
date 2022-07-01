//
//  TrackingScrollView.swift
//  PerformanceTest
//
//  Created by akozlov on 01.07.2022.
//

import SwiftUI

public struct TrackingScrollView<Content: View>: View {

    let axes: Axis.Set
    let showsIndicators: Bool
    let onContentOffsetChange: (CGPoint) -> Void
    let content: Content

    public init(
        axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        onContentOffsetChange: @escaping (CGPoint) -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.onContentOffsetChange = onContentOffsetChange
        self.content = content()
    }
    
    @Namespace
    private var scrollNamespace
    
    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            ZStack {
                GeometryReader { proxy in
                    let offset = proxy.frame(in: .named(scrollNamespace)).origin
                    Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
                }
                content
            }
        }
        .coordinateSpace(name: scrollNamespace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            onContentOffsetChange(CGPoint(x: -value.x, y: -value.y))
        }
    }
    
}

// MARK: - ScrollViewOffsetPreferenceKey
private extension TrackingScrollView {
    
    struct ScrollViewOffsetPreferenceKey: PreferenceKey {
        
        static var defaultValue: CGPoint { .zero }
        
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
            let nextValue = nextValue()
            value = CGPoint(x: value.x + nextValue.x, y: value.y + nextValue.y)
        }
        
    }
    
}
