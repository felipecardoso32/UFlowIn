//
//  AppState.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {

    // MARK: - Fluxo do aplicativo

    @Published var splashFinished: Bool = false

    @Published var onboardingFinished: Bool = false

    @Published var loggedIn: Bool = false

    @Published var registrationFinished: Bool = false


    // MARK: - Login

    func login() {

        loggedIn = true
    }


    // MARK: - Onboarding

    func finishOnboarding() {

        onboardingFinished = true
    }


    // MARK: - Cadastro

    func finishRegistration() {

        registrationFinished = true
    }
}
