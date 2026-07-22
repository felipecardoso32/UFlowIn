//
//  UserProfile.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import Foundation


enum Gender: String, CaseIterable, Identifiable {
    case masculino = "Masculino"
    case feminino = "Feminino"
    case outro = "Outro"
    var id: String { rawValue }
}
 
enum ActivityLevel: String, CaseIterable, Identifiable {
    case sedentario = "Sedentário"
    case poucoAtivo = "Pouco Ativo"
    case regular = "Regular"
    case ativo = "Ativo"
    case muitoAtivo = "Muito Ativo"
    var id: String { rawValue }
 
    var subtitle: String {
        switch self {
        case .sedentario: return "Quase não pratico exercícios"
        case .poucoAtivo: return "Pratico exercícios ocasionalmente"
        case .regular: return "Faço exercícios de 1 a 3 vezes por semana"
        case .ativo: return "Faço exercícios 4 ou mais vezes por semana"
        case .muitoAtivo: return "Treino quase todos os dias"
        }
    }
 
    var icon: String {
        switch self {
        case .sedentario: return "cloud"
        case .poucoAtivo: return "figure.walk"
        case .regular: return "figure.run"
        case .ativo: return "flame"
        case .muitoAtivo: return "bolt.fill"
        }
    }
}
 
struct Goal: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
}
 
let allGoals: [Goal] = [
    Goal(title: "Manter uma rotina ativa", icon: "figure.walk.circle"),
    Goal(title: "Melhorar o condicionamento", icon: "heart.circle"),
    Goal(title: "Criar hábitos saudáveis", icon: "leaf.circle"),
    Goal(title: "Melhorar mobilidade e flexibilidade", icon: "figure.flexibility"),
    Goal(title: "Perder peso", icon: "scalemass"),
    Goal(title: "Ganhar massa muscular", icon: "dumbbell")
]
 
struct FavoriteActivity: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
}
 
let allFavoriteActivities: [FavoriteActivity] = [
    FavoriteActivity(title: "Corrida", icon: "figure.run"),
    FavoriteActivity(title: "Caminhada", icon: "figure.walk"),
    FavoriteActivity(title: "HIIT", icon: "bolt.heart"),
    FavoriteActivity(title: "Bicicleta", icon: "bicycle"),
    FavoriteActivity(title: "Musculação", icon: "dumbbell.fill"),
    FavoriteActivity(title: "Calistenia", icon: "figure.strengthtraining.functional"),
    FavoriteActivity(title: "Alongamento", icon: "figure.cooldown"),
    FavoriteActivity(title: "Yoga", icon: "figure.yoga"),
    FavoriteActivity(title: "Meditação", icon: "brain.head.profile")
]
 
/// utilizado para login
struct UserProfile {
    var fullName: String = ""
    var email: String = ""
    var password: String = ""
 
    var gender: Gender? = nil
    var age: String = ""
    var weightKg: String = ""
    var heightM: String = ""
 
    var selectedGoals: Set<Goal.ID> = []
    var activityLevel: ActivityLevel? = nil
    var selectedFavoriteActivities: Set<FavoriteActivity.ID> = []
 
    var appleHealthConnected: Bool = false
}
