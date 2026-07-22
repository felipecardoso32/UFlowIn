//
//  ActivitiesView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct ActivitiesView: View {

    enum Category: String, CaseIterable {

        case pilates = "Pilates"
        case running = "Corrida / Caminhada"
        case calisthenics = "Calistenia"
    }

    @State private var selectedCategory:
        Category = .pilates

    var body: some View {

        NavigationStack {

            VStack {

                Picker(
                    "Categoria",
                    selection:
                        $selectedCategory
                ) {

                    ForEach(
                        Category.allCases,
                        id: \.self
                    ) { category in

                        Text(category.rawValue)
                            .tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                ScrollView {

                    switch selectedCategory {

                    case .pilates:

                        ActivityList(
                            title: "Pilates",
                            action: .pilates
                        )

                    case .running:

                        ActivityList(
                            title:
                                "Corrida / Caminhada",
                            action: .running
                        )

                    case .calisthenics:

                        ActivityList(
                            title: "Calistenia",
                            action: .calisthenics
                        )
                    }
                }
            }
            .navigationTitle("Atividades")
        }
    }
}

enum ActivityType {

    case pilates
    case running
    case calisthenics
}

struct ActivityList: View {

    let title: String
    let action: ActivityType

    @State private var showNotification = false
    @State private var showActivity = false

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 20
        ) {

            Text(title)
                .font(.title.bold())

            ActivityCard(
                title: title,
                subtitle:
                    "Comece sua atividade agora."
            ) {

                showNotification = true
            }
        }
        .padding()
        .alert(
            "Permitir notificações?",
            isPresented:
                $showNotification
        ) {

            Button("Permitir") {

                showActivity = true
            }

            Button(
                "Agora não",
                role: .cancel
            ) {

                showActivity = true
            }

        } message: {

            Text(
                "Ative as notificações para receber lembretes durante suas atividades."
            )
        }
        .navigationDestination(
            isPresented: $showActivity
        ) {

            switch action {

            case .running:

                RunningView()

            case .pilates:

                WorkoutView(
                    title: "Pilates",
                    exercises: [

                        WorkoutExercise(
                            name: "Ponte de Ombros",
                            imageName: "PonteOmbros"
                        ),

                        WorkoutExercise(
                            name: "Alongamento da Coluna",
                            imageName: "AlongamentoColuna"
                        ),

                        WorkoutExercise(
                            name: "Flexão de Braço",
                            imageName: "FlexaoBraco"
                        )
                    ]
                )

            case .calisthenics:

                WorkoutView(
                    title: "Calistenia",
                    exercises: [

                        WorkoutExercise(
                            name: "Agachamento Livre",
                            imageName: "Agachamento"
                        ),

                        WorkoutExercise(
                            name: "Avanço Alternado",
                            imageName: "AvancoAlternado"
                        ),

                        WorkoutExercise(
                            name: "Prancha Inversa",
                            imageName: "PranchaInversa"
                        ),

                        WorkoutExercise(
                            name: "Extensão Lombar",
                            imageName: "ExtensaoLombar"
                        )
                    ]
                )
            }
        }
    }
}

struct ActivityCard: View {

    let title: String
    let subtitle: String
    let action: () -> Void

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 16
        ) {

            Text(title)
                .font(.title2.bold())

            Text(subtitle)
                .foregroundStyle(.secondary)

            PrimaryButton(
                title: "Iniciar"
            ) {

                action()
            }
        }
        .padding()
        .background(
            Color.gray.opacity(0.08)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
    }
}
