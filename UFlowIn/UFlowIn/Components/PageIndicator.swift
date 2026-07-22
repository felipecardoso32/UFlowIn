//
//  PageIndicator.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//


import SwiftUI
 
/// Dots shown below onboarding/setup screens; the current page is highlighted.
struct PageIndicator: View {
    let numberOfPages: Int
    let currentPage: Int
 
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? .labelsPrimary : .labelsPrimary)
                    .frame(width: index == currentPage ? 18 : 6, height: 6)
                    .animation(.easeInOut(duration: 0.2), value: currentPage)
            }
        }
    }
}
 
