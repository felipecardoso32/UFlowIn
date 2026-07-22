//
//  IconCircleButton.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//
/*
import SwiftUI

/// Reusable filled button used across every flow ("Próximo", "Entendi", "Começar",
/// "Login", "Avançar", "Continuar" etc). Just pass the text you need.
struct PrimaryButton: View {
    let title: String
    var isEnabled: Bool = true
    var backgroundColor: Color = Theme.primary
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: Theme.buttonHeight)
                .background(isEnabled ? backgroundColor : backgroundColor.opacity(0.4))
                .clipShape(Capsule())
        }
        .disabled(!isEnabled)
    }
}

/// Outlined / secondary style, e.g. for "Editar" or "Não Permitir".
struct SecondaryButton: View {
    let title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Theme.primary)
                .frame(maxWidth: .infinity)
                .frame(height: Theme.buttonHeight)
                .background(Theme.primary.opacity(0.08))
                .clipShape(Capsule())
        }
    }
}

/// "Iniciar sessão com a Apple" / "Iniciar sessão com o Google" style button.
struct SocialLoginButton: View {
    enum Provider {
        case apple, google
        var title: String {
            switch self {
            case .apple: return "Iniciar sessão com a Apple"
            case .google: return "Iniciar sessão com o Google"
            }
        }
        var signUpTitle: String {
            switch self {
            case .apple: return "Criar conta com a Apple"
            case .google: return "Criar conta com o Google"
            }
        }
        var icon: String {
            switch self {
            case .apple: return "apple.logo"
            case .google: return "globe"
            }
        }
    }

    let provider: Provider
    var isSignUp: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: provider.icon)
                Text(isSignUp ? provider.signUpTitle : provider.title)
                    .font(.system(size: 15, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: Theme.buttonHeight)
            .background(Color.black)
            .clipShape(Capsule())
        }
    }
}

/// Small pill-shaped icon button, used for the pencil "edit profile" shortcut etc.
struct IconCircleButton: View {
    let systemName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Theme.textPrimary)
                .frame(width: 36, height: 36)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
        }
    }
}*/
