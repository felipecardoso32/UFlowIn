import SwiftUI

struct SelectionCard: View {

    // MARK: - Tipo de visual

    enum Visual {
        case icon(String)
        case image(String)
        case none
    }

    // MARK: - Tamanho do Card

    enum CardSize {
        case small
        case big

        var height: CGFloat {
            switch self {
            case .small:
                return 60
            case .big:
                return 80
            }
        }
    }

    // MARK: - Estilo do card

    enum Style {
        case `default`
        case icon
    }

    // MARK: - Propriedades

    let title: String
    let subtitle: String?
    let visual: Visual

    var style: Style = .default

    let isSelected: Bool

    var action: () -> Void

    // Tamanho padrão
    var size: CardSize = .small


    // MARK: - Body

    var body: some View {

        Button {

            action()

        } label: {

            HStack(spacing: 10) {

                // MARK: - Visual

                visualView


                // MARK: - Textos

                VStack(
                    alignment: .leading,
                    spacing: 1
                ) {

                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.labelsBlack)

                    if let subtitle {

                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.labelsVibrant2)
                    }
                }


                Spacer()


                // MARK: - Checkmark

                checkmarkView
            }
            .padding(.horizontal, 16)
            .frame(
                maxWidth: .infinity,
                minHeight: size.height,
                maxHeight: size.height
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
                    ? .accentsBlueApp
                    : .labelsVibrant4.opacity(0.2),
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

            Image(systemName: name)
                .font(
                    .system(
                        size: 24,
                        weight: .medium
                    )
                )
                .foregroundStyle(.accentsBlueApp)


        case .image(let name):

            Image(name)
                .resizable()
                .scaledToFit()
                .frame(
                    width: 50,
                    height: 50
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
            .foregroundStyle(.accentsBlueApp)
        }
    }
}
