//
//  ProgreesDots.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//
import SwiftUI

struct ProgressDots: View {

    let currentPage: Int
    let totalPages: Int

    var body: some View {

        HStack(spacing: 8) {

            ForEach(
                0..<totalPages,
                id: \.self
            ) { index in

                Capsule()
                    .fill(
                        index == currentPage
                        ? .labelsBlack
                        : .labelsBlack.opacity(0.3)
                    )
                    .frame(
                        width: index == currentPage
                        ? 24
                        : 8,
                        height: 8
                    )
                    .animation(
                        .easeInOut,
                        value: currentPage
                    )
            }
        }
    }
}
