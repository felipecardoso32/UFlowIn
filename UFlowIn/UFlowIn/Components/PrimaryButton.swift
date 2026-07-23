import SwiftUI

struct PrimaryButton: View {

    enum Style {
        case `default`
        case secondary
        case tertiary
    }

    let title: String
    var style: Style = .default
    var action: () -> Void
   

    var body: some View {

        Button {
            action()
        } label: {

            Text(title)
                .font(.headline)
                .foregroundStyle(textColor)
                .frame(width: 300)
                .frame(height: 44)
                .background(background)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: cornerButton
                    )
                )
        }
    }

    
    private var cornerButton: CGFloat { // alturas variáveis do botao
        switch style {
            
        case .default:
            return 30
            
        case .secondary:
            return 30
            
        case .tertiary:
            return 30
            
            
        }
    }
    private var sizeHeight: CGFloat { // alturas variáveis do botao
        switch style {

        case .default:
            return 44

        case .secondary:
            return 44

        case .tertiary:
            return 44
        }
    }
    
    private var sizeWidth: CGFloat { // alturas variáveis do botao
        switch style {

        case .default:
            return 44

        case .secondary:
            return 200

        case .tertiary:
            return 200
        }
    }
    // Cor do texto

    private var textColor: Color {

        switch style {

        case .default:
            return .white

        case .secondary:
            return .white

        case .tertiary:
            return .white
        }
    }

    // Fundo

    @ViewBuilder
    private var background: some View {

        switch style { // estilos

        case .default:
            Color.colorsIndigo
                .frame(width: 300)
                .frame(height: 44)
           
           /* LinearGradient(
                colors: [
                    .blue,
                    .purple
                ],
                startPoint: .leading,
                endPoint: .trailing
            )*/

        case .secondary:

            Color.accentsMintApp // botao verde
                .frame(width: 200)
                .frame(height: 44)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: cornerButton
                    )
                )

        case .tertiary:

            Color.colorsIndigo // botao verde
                .frame(width: 200)
                .frame(height: 44)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: cornerButton
                    )
                )
        }
    }
}
