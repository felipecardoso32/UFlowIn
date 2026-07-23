//
//  FavoriteActivitiesView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct FavoriteActivitiesView: View {

    var onContinue: () -> Void

    @State private var selected: Set<String> = []

    let activities = [

        "Pilates",
        "Corrida",
        "Caminhada",
        "Calistenia",
        "Musculação",
        "Yoga",
        "Ciclismo"
    ]

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 20
        ) {

            Text("Atividades favoritas")
                .font(.largeTitle.bold())

            Text(
                "Escolha as atividades que você mais gosta."
            )
            .foregroundStyle(.secondary)

            ScrollView {

                VStack(spacing: 12) {

                    ForEach(
                        activities,
                        id: \.self
                    ) { activity in

                        SelectionCard(
                            title: activity,
                            subtitle: nil,
                            isSelected:
                                selected.contains(activity)
                        ) {

                            if selected.contains(activity) {

                                selected.remove(activity)

                            } else {

                                selected.insert(activity)
                            }
                        }
                    }
                }
            }

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
#Preview{
    FavoriteActivitiesView(  onContinue: {
        print("Continuar pressionado")
    })
}
