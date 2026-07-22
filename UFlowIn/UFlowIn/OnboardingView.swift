//
//  OnboardingView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct OnboardingView: View {

    @EnvironmentObject var appState: AppState

    @State private var currentPage = 0

    private let pages = [

        OnboardingPage(
            title: "Sua jornada começa aqui",
            subtitle: "Crie uma rotina mais saudável e acompanhe sua evolução.",
            imageName: "Onboarding1"
        ),

        OnboardingPage(
            title: "Uma aplicação que evolui com você",
            subtitle: "Tenha suas atividades, metas e progresso em um só lugar.",
            imageName: "Onboarding2"
        ),

        OnboardingPage(
            title: "Evolua todos os dias",
            subtitle: "Comece agora e transforme seus hábitos.",
            imageName: "Onboarding3"
        )
    ]

    var body: some View {

        VStack {

            TabView(
                selection: $currentPage
            ) {

                ForEach(
                    pages.indices,
                    id: \.self
                ) { index in

                    VStack(spacing: 30) {

                        Spacer()

                        Image(
                            pages[index].imageName
                        )
                        .resizable()
                        .scaledToFit()
                        .frame(
                            maxWidth: 300,
                            maxHeight: 300
                        )

                        Text(
                            pages[index].title
                        )
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)

                        Text(
                            pages[index].subtitle
                        )
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            ProgressDots(
                currentPage: currentPage,
                totalPages: pages.count
            )

            PrimaryButton(
                title:
                    currentPage == pages.count - 1
                    ? "Começar"
                    : "Continuar"
            ) {

                if currentPage < pages.count - 1 {

                    withAnimation {

                        currentPage += 1
                    }

                } else {

                    appState.finishOnboarding()
                }
            }
            .padding(24)
        }
    }
}

struct OnboardingPage {

    let title: String
    let subtitle: String
    let imageName: String
}

#Preview {

    OnboardingView()
        .environmentObject(
            AppState()
        )
}
