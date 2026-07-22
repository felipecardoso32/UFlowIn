//
//  RunningView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI
import Combine

struct RunningView: View {

    @Environment(\.dismiss)
    private var dismiss

    @State private var isRunning = false
    @State private var isPaused = false

    @State private var seconds = 0

    var body: some View {

        VStack(spacing: 30) {

            Text("Corrida / Caminhada")
                .font(.title.bold())

            Text(
                timeString(
                    seconds: seconds
                )
            )
            .font(
                .system(
                    size: 60,
                    weight: .bold,
                    design: .rounded
                )
            )

            Spacer()

            if !isRunning {

                PrimaryButton(
                    title: "Iniciar"
                ) {

                    isRunning = true
                    isPaused = false
                }

            } else {

                HStack {

                    Button {

                        isPaused.toggle()

                    } label: {

                        Image(
                            systemName:
                                isPaused
                                ? "play.fill"
                                : "pause.fill"
                        )
                        .font(.largeTitle)
                    }

                    Button {

                        isRunning = false

                    } label: {

                        Text("Parar")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .padding(24)
        .onReceive(
            Timer.publish(
                every: 1,
                on: .main,
                in: .common
            )
            .autoconnect()
        ) { _ in

            if isRunning && !isPaused {

                seconds += 1
            }
        }
    }

    private func timeString(
        seconds: Int
    ) -> String {

        let minutes = seconds / 60
        let seconds = seconds % 60

        return String(
            format: "%02d:%02d",
            minutes,
            seconds
        )
    }
}
#Preview {

    RunningView()
        .environmentObject(
            AppState()
        )
}
