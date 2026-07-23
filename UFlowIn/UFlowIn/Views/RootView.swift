//
//  RootView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct RootView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        Group {

            if !appState.splashFinished {

                SplashScreen()

            } else if !appState.onboardingFinished {

                OnboardingView()

            } else if !appState.loggedIn {

                LoginView()

            } else if !appState.registrationFinished {

                RegistrationFlowView()

            } else {

                MainTabView()
            }
        }
    }
}
