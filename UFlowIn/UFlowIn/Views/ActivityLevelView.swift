//
//  ActivityLevelView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct ActivityLevelView: View {

    var onContinue: () -> Void


    enum ActVisual {

        case icon(String)

        case image(String)
    }


    struct ActivityLevel: Identifiable {

        let id = UUID()

        let title: String

        let subtitle: String

        let visual: ActVisual
    }


    @State private var selected: String?


    let levels: [ActivityLevel] = [

        ActivityLevel(
            title: "Sedentário",
            subtitle: "Pouca ou nenhuma atividade física",
            visual: .image("pose4")
        ),

        ActivityLevel(
            title: "Pouco ativo",
            subtitle: "Atividade física leve",
            visual: .icon("figure.walk")
        ),

        ActivityLevel(
            title: "Ativo",
            subtitle: "Exercícios regularmente",
            visual: .icon("figure.run")
        ),

        ActivityLevel(
            title: "Muito ativo",
            subtitle: "Exercícios intensos frequentemente",
            visual: .icon(
                "figure.strengthtraining.traditional"
            )
        ),

        ActivityLevel(
            title: "Extremamente ativo",
            subtitle: "Treinos intensos diariamente",
            visual: .icon(
                "figure.highintensity.intervaltraining"
            )
        )
    ]


    var body: some View {

        VStack {

            ScrollView {

                VStack(spacing: 12) {

                    ForEach(levels) { level in

                        SelectionCard(

                            title: level.title,

                            subtitle: level.subtitle,

                            visual: convertVisual(
                                level.visual
                            ),

                            style: .icon,

                            isSelected:
                                selected == level.title

                        ) {

                            selected = level.title
                        }
                    }
                }
            }
        }
    }


    private func convertVisual(
        _ visual: ActVisual
    ) -> SelectionCard.Visual {

        switch visual {

        case .icon(let name):

            return .icon(name)

        case .image(let name):

            return .image(name)
        }
    }
}


// MARK: - Preview

#Preview {

    ActivityLevelView {

        print(
            "Continuar pressionado"
        )
    }
}
