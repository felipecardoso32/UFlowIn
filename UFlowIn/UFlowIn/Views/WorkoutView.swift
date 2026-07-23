//
//  WorkoutView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct WorkoutExercise {

    let name: String
    let imageName: String
}

struct WorkoutView: View {

    let title: String

    let exercises: [
        WorkoutExercise
    ]

    @State private var currentExercise = 0

    @State private var showFinish = false

    var body: some View {

        VStack(spacing: 20) {

            Text(title)
                .font(.title.bold())

            Text(
                "\(currentExercise + 1) de \(exercises.count)"
            )
            .foregroundStyle(.secondary)

            Image(
                exercises[
                    currentExercise
                ].imageName
            )
            .resizable()
            .scaledToFit()
            .frame(height: 250)

            Text(
                exercises[
                    currentExercise
                ].name
            )
            .font(.title2.bold())

            Spacer()

            HStack {

                Button("Anterior") {

                    if currentExercise > 0 {

                        currentExercise -= 1
                    }
                }
                .disabled(
                    currentExercise == 0
                )

                Spacer()

                PrimaryButton(
                    title:
                        currentExercise ==
                        exercises.count - 1
                        ? "Finalizar"
                        : "Próximo"
                ) {

                    if currentExercise <
                        exercises.count - 1 {

                        currentExercise += 1

                    } else {

                        showFinish = true
                    }
                }
                .frame(width: 180)
            }
        }
        .padding(24)
        .sheet(
            isPresented: $showFinish
        ) {

            ActivityFinishView()
        }
    }
}

