//
//  FavoriteActivitiesView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct FavoriteActivitiesView: View {

    // MARK: - Navegação

    var onContinue: () -> Void


    // MARK: - Visual da atividade

    enum ActivityVisual {

        // SF Symbol
        case icon(String)

        // Imagem adicionada no Assets.xcassets
        case image(String)
    }


    // MARK: - Modelo da atividade

    struct Activity: Identifiable {

        let id = UUID()

        let title: String

        let visual: ActivityVisual
    }


    // MARK: - Estado

    @State private var selected: Set<String> = []


    // MARK: - Atividades

    let activities: [Activity] = [

        Activity(
            title: "Pilates",
            visual: .icon("figure.mind.and.body")
        ),

        Activity(
            title: "Corrida",
            visual: .icon("figure.run")
        ),

        Activity(
            title: "Caminhada",
            visual: .icon("figure.walk")
        ),

        Activity(
            title: "Calistenia",
            visual: .icon(
                "figure.strengthtraining.functional"
            )
        ),

        Activity(
            title: "Musculação",
            visual: .icon(
                "figure.strengthtraining.traditional"
            )
        ),

        Activity(
            title: "Yoga",
            visual: .icon(
                "figure.mind.and.body"
            )
        ),

        Activity(
            title: "Ciclismo",
            visual: .icon(
                "figure.outdoor.cycle"
            )
        )
    ]


    // MARK: - Body

    var body: some View {

        ZStack {

            Color(.grayBackground)
                .ignoresSafeArea()


            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                // MARK: - Título

                Text("Atividades favoritas")
                    .font(.largeTitle.bold())


                // MARK: - Subtítulo

                Text(
                    "Escolha as atividades que você mais gosta."
                )
                .foregroundStyle(.secondary)


                // MARK: - Lista de atividades

                ScrollView {

                    VStack(spacing: 12) {

                        ForEach(activities) { activity in

                            SelectionCard(

                                title: activity.title,

                                subtitle: nil,

                                visual: convertVisual(
                                    activity.visual
                                ),

                                style: .icon,

                                isSelected:
                                    selected.contains(
                                        activity.title
                                    )

                            ) {

                                toggleSelection(
                                    activity.title
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
        _ activity: String
    ) {

        if selected.contains(activity) {

            selected.remove(activity)

        } else {

            selected.insert(activity)
        }
    }


    // MARK: - Converter visual

    private func convertVisual(
        _ visual: ActivityVisual
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

    FavoriteActivitiesView {

        print(
            "Continuar pressionado"
        )
    }
}
