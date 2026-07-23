//
//  GoalsView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct GoalsView: View {

    // MARK: - Navegação

    var onContinue: () -> Void


    // MARK: - Visual do objetivo

    enum GoalVisual {

        // SF Symbol
        case icon(String)

        // Imagem adicionada no Assets.xcassets
        case image(String)
    }


    // MARK: - Modelo do objetivo

    struct Goal: Identifiable {

        let id = UUID()

        let title: String

        let visual: GoalVisual
    }


    // MARK: - Estado

    @State private var selected: Set<String> = []


    // MARK: - Objetivos

    let goals: [Goal] = [

        Goal(
            title: "Manter uma rotina ativa",
            visual: .icon("figure.walk")
        ),

        Goal(
            title: "Melhorar condicionamento",
            visual: .icon("heart.fill")
        ),

        Goal(
            title: "Criar hábitos saudáveis",
            visual: .icon("figure.mind.and.body")
        ),

        Goal(
            title: "Melhorar mobilidade e flexibilidade",
            visual: .icon("figure.flexibility")
        ),

        Goal(
            title: "Perder peso",
            visual: .icon("figure.walk.treadmill")
        ),

        Goal(
            title: "Ganhar massa muscular",
            visual: .icon(
                "figure.strengthtraining.traditional"
            )
        )
    ]


    // MARK: - Body

    var body: some View {

        ZStack {

            Color(.grayBackground)
                .ignoresSafeArea()


            VStack(
                alignment: .center,
                spacing: 20
            ) {

                // MARK: - Título

                Text("Objetivos")
                    .font(.largeTitle.bold())


                // MARK: - Subtítulo

                Text(
                    "O que você deseja alcançar?"
                )
                .foregroundStyle(.secondary)


                // MARK: - Cards

                ScrollView {

                    VStack(spacing: 12) {

                        ForEach(goals) { goal in

                            SelectionCard(

                                title: goal.title,

                                subtitle: nil,

                                visual: convertVisual(
                                    goal.visual
                                ),

                                style: .icon,

                                isSelected:
                                    selected.contains(
                                        goal.title
                                    )

                            ) {

                                toggleSelection(
                                    goal.title
                                )
                            }
                        }
                    }
                }


                // MARK: - Botão continuar

                PrimaryButton(
                    title: "Continuar",
                    style: .tertiary
                ) {

                    onContinue()
                }
            }
            .padding(24)
        }
    }


    // MARK: - Selecionar / Desselecionar

    private func toggleSelection(
        _ goal: String
    ) {

        if selected.contains(goal) {

            selected.remove(goal)

        } else {

            selected.insert(goal)
        }
    }


    // MARK: - Converter visual

    private func convertVisual(
        _ visual: GoalVisual
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

    GoalsView {

        print(
            "Continuar pressionado"
        )
    }
}
