//
//  GoalsView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct GoalsView: View {

    var onContinue: () -> Void

    @State private var selected: Set<String> = []

    let goals = [

        "Perder peso",
        "Ganhar massa muscular",
        "Melhorar condicionamento",
        "Criar uma rotina saudável",
        "Aumentar minha força"
    ]

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 20
        ) {

            Text("Objetivos")
                .font(.largeTitle.bold())

            Text(
                "O que você deseja alcançar?"
            )
            .foregroundStyle(.secondary)

            ScrollView {

                VStack(spacing: 12) {

                    ForEach(
                        goals,
                        id: \.self
                    ) { goal in

                        SelectionCard(
                            title: goal,
                            subtitle: nil,
                            isSelected: selected.contains(goal)
                        ) {

                            if selected.contains(goal) {

                                selected.remove(goal)

                            } else {

                                selected.insert(goal)
                            }
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

