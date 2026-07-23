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
    //@State var textTitle: String
    
    private let pages = [

        OnboardingPage(
            title: "Sua jornada começa aqui",
            subtitle: "Treine, acompanhe seu progresso e desenvolva hábitos saudáveis no seu ritmo.",
            imageName: "pose3"
        ),

        OnboardingPage(
            title: "Uma aplicação que evolui com você",
            subtitle: "Tenha suas atividades, metas e progresso em um só lugar.",
            imageName: "SimbolosOnboarding2"
        ),

        OnboardingPage(
            title: "Evolua todos os dias",
            subtitle: "Comece agora e transforme seus hábitos.",
            imageName: "mascote trofeu"
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
                            maxWidth: 200,
                            maxHeight: 200
                        )

                        Text(
                            pages[index].title
                        )
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .frame(width: 264, alignment: .center)
                        .padding(.horizontal, 28)
                        .foregroundStyle(textTitleColor)

                        Text(
                            pages[index].subtitle
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.labelsBlack)
                        .frame(width: 340, height: 53, alignment: .center)
                        .padding(.horizontal, 24)
                        
                        
                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

         

            PrimaryButton(
                title: textTitle,
                style: .secondary
            ) {
                
                if currentPage < pages.count - 1 {

                    withAnimation {

                        currentPage += 1
                    }

                } else {

                    appState.finishOnboarding()
                }
            
            }
            //.padding(10)
            ProgressDots(
                currentPage: currentPage,
                totalPages: pages.count
            )
            .padding(20)
        }
    }
    
    

    
    
    // mudar 3 textos do botao do onboarding

    private var textTitle: String {

        switch currentPage {

        case 0:
            return "Próximo"

        case 1:
            return "Entendi"

        case 2:
            return "Começar"

        default:
            return "Próximo"
        }
    }
    private var textTitleColor: Color {

        switch currentPage {

        case 0:
            return .colorsIndigo

        case 1:
            return .accentsBlue

        case 2:
            return .accentsMintApp

        default:
            return .colorsIndigo
        }
    }
    
}

// mudar as 3 cores dos textos do onboearding




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
