//
//  AppState.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {



    @Published var splashFinished: Bool = false

    @Published var onboardingFinished: Bool = false

    @Published var loggedIn: Bool = false

    @Published var registrationFinished: Bool = false


    // Login

    func login() {

        loggedIn = true
    }


    // Onboarding

    func finishOnboarding() {

        onboardingFinished = true
    }


    //  Cadastro

    func finishRegistration() {

        registrationFinished = true
    }
}
