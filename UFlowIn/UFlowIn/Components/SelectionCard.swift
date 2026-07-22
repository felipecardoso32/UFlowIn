//
//  SelectionCard.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct SelectionCard: View {

    let title: String
    let subtitle: String?

    let isSelected: Bool

    var action: () -> Void

    var body: some View {

        Button {

            action()

        } label: {

            HStack(spacing: 14) {

                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {

                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    if let subtitle {

                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                Image(
                    systemName:
                        isSelected
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .font(.title2)
                .foregroundStyle(
                    isSelected
                    ? Color.blue
                    : Color.gray.opacity(0.4)
                )
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(
                    cornerRadius: 16
                )
                .fill(
                    isSelected
                    ? Color.blue.opacity(0.08)
                    : Color.white
                )
            )
            .overlay {

                RoundedRectangle(
                    cornerRadius: 16
                )
                .stroke(
                    isSelected
                    ? Color.blue
                    : Color.gray.opacity(0.2),
                    lineWidth: isSelected ? 2 : 1
                )
            }
        }
    }
}

