//
//  ActivityLevelView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//
import SwiftUI

struct ActivityLevelView: View {

    var onContinue: () -> Void

    @State private var selected: String?

    let levels = [

        (
            "Sedentário",
            "Pouca ou nenhuma atividade física"
        ),

        (
            "Pouco ativo",
            "Atividade física leve"
        ),

        (
            "Ativo",
            "Exercícios regularmente"
        ),

        (
            "Muito ativo",
            "Exercícios intensos frequentemente"
        ),

        (
            "Extremamente ativo",
            "Treinos intensos diariamente"
        )
    ]

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 20
        ) {

            Text("Nível de atividade")
                .font(.largeTitle.bold())

            Text(
                "Escolha apenas uma opção."
            )
            .foregroundStyle(.secondary)

            ScrollView {

                VStack(spacing: 12) {

                    ForEach(
                        levels,
                        id: \.0
                    ) { level in

                        SelectionCard(
                            title: level.0,
                            subtitle: level.1,
                            isSelected:
                                selected == level.0
                        ) {

                            selected = level.0
                        }
                    }
                }
            }

            PrimaryButton(
                title: "Continuar"
            ) {

                onContinue()
            }
        }
        .padding(24)
    }
}
