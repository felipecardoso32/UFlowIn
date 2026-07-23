//
//  SelectionCard.swift
//  UFlowIn
//

import SwiftUI

struct SelectionCard: View {

    // MARK: - Tipo de visual

    enum Visual {

        // SF Symbol
        case icon(String)

        // Imagem do Assets.xcassets
        case image(String)

        // Sem visual
        case none
    }


    // MARK: - Estilo do card

    enum Style {

        // Checkmark dentro de círculo
        case `default`

        // Checkmark sem círculo
        case icon
    }


    // MARK: - Propriedades

    let title: String

    let subtitle: String?

    let visual: Visual

    var style: Style = .default

    let isSelected: Bool

    var action: () -> Void


    // MARK: - Body

    var body: some View {

        Button {

            action()

        } label: {

            HStack(spacing: 12) {

                // MARK: - Visual

                visualView


                // MARK: - Textos

                VStack(
                    alignment: .leading,
                    spacing: 1
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


                // MARK: - Checkmark

                checkmarkView
            }
            .padding()
            .frame(
                maxWidth: .infinity
            )
            .background(

                RoundedRectangle(
                    cornerRadius: 16
                )
                .fill(
                    isSelected
                    ? .accentsBlueApp.opacity(0.08)
                    : Color.grayElement
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
                    lineWidth:
                        isSelected
                        ? 2
                        : 1
                )
            }
        }
    }


    // MARK: - Visual

    @ViewBuilder
    private var visualView: some View {

        switch visual {

        case .icon(let name):

            Image(
                systemName: name
            )
            .font(
                .system(
                    size: 24,
                    weight: .medium
                )
            )
            .foregroundStyle(
                isSelected
                ? .accentsBlueApp
                : .labelsVibrant2
            )


        case .image(let name):

            Image(name)
                .resizable()
                .scaledToFit()
                .frame(
                    width: 45,
                    height: 45
                )


        case .none:

            EmptyView()
        }
    }


    // MARK: - Checkmark

    @ViewBuilder
    private var checkmarkView: some View {

        switch style {

        case .default:

            Image(
                systemName:
                    isSelected
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .font(.title2)
            .foregroundStyle(
                isSelected
                ? .accentsBlueApp
                : .labelsVibrant2.opacity(0.4)
            )


        case .icon:

            Image(
                systemName:
                    isSelected
                    ? "checkmark"
                    : ""
            )
            .font(
                .system(
                    size: 20,
                    weight: .semibold
                )
            )
            .foregroundStyle(
                .accentsBlueApp
            )
        }
    }
}
