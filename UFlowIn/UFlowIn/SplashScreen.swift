//
//  Untitled.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct SplashScreen: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            Image("LogoUFlowIn")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
        }
        .task {

            try? await Task.sleep(
                for: .seconds(2)
            )

            await MainActor.run {

                appState.splashFinished = true
            }
        }
    }
}
#Preview {

    SplashScreen()
        .environmentObject(
            AppState()
        )
}
