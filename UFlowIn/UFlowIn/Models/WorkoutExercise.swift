//
//  WorkoutExercise.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import Foundation

enum ActivityCategory: String, CaseIterable, Identifiable {
    case pilates = "Pilates"
    case corridaCaminhada = "Corrida / Caminhada"
    case calistenia = "Calistenia"
    var id: String { rawValue }
}

struct WorkoutExercise: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let durationText: String
    let sfSymbol: String
    let focusTags: [String]
    let description: String
    /// duração do descanso , nil se for a ultima.
    let restSeconds: Int?
}

struct WorkoutSession: Identifiable {
    let id = UUID()
    let title: String
    let level: String
    let totalMinutes: Int
    let exercises: [WorkoutExercise]
}

// MARK: - Mock data

enum MockWorkouts {
    static func session(for category: ActivityCategory) -> WorkoutSession {
        switch category {
        case .pilates:
            return WorkoutSession(
                title: "Pilates Matinal",
                level: "15 min · Iniciante",
                totalMinutes: 15,
                exercises: [
                    WorkoutExercise(title: "Ponte de Ombros", subtitle: "Mobilidade, Postura, Core",
                                     durationText: "1:59", sfSymbol: "figure.pilates",
                                     focusTags: ["Mobilidade", "Postura", "Core"],
                                     description: "Comece o dia desperto com uma sessão de Pilates focada em mobilidade, postura e fortalecimento do core.",
                                     restSeconds: 15),
                    WorkoutExercise(title: "Alongamento da Coluna", subtitle: "Mobilidade, Postura, Core",
                                     durationText: "1:59", sfSymbol: "figure.flexibility",
                                     focusTags: ["Mobilidade", "Postura", "Core"],
                                     description: "Alongamentos controlados para aliviar rigidez e melhorar o equilíbrio antes de preparar você para o dia.",
                                     restSeconds: nil)
                ]
            )
        case .calistenia:
            return WorkoutSession(
                title: "Calistenia - Pernas",
                level: "15 min · Iniciante",
                totalMinutes: 15,
                exercises: [
                    WorkoutExercise(title: "Agachamento Livre", subtitle: "Hipertrofia, Resistência, Fitness",
                                     durationText: "1:59", sfSymbol: "figure.strengthtraining.functional",
                                     focusTags: ["Hipertrofia", "Resistência", "Fitness"],
                                     description: "Além dos benefícios ao corpo, o treino também contribui para a saúde mental, ajudando a reduzir o estresse.",
                                     restSeconds: 15),
                    WorkoutExercise(title: "Avanço Alternado", subtitle: "Hipertrofia, Resistência, Fitness",
                                     durationText: "1:59", sfSymbol: "figure.step.training",
                                     focusTags: ["Hipertrofia", "Resistência", "Fitness"],
                                     description: "Com consistência, é possível melhorar a postura, a qualidade do sono e o equilíbrio da vida.",
                                     restSeconds: nil)
                ]
            )
        case .corridaCaminhada:
            return WorkoutSession(title: "Corrida ao Amanhecer", level: "Livre", totalMinutes: 20, exercises: [])
        }
    }
}
