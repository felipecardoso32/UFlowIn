//
//  MainTabView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {

        TabView {

            HomeView()
                .tabItem {

                    Label(
                        "Início",
                        systemImage: "house.fill"
                    )
                }

            ActivitiesView()
                .tabItem {

                    Label(
                        "Atividades",
                        systemImage: "figure.run"
                    )
                }

            ProgressView()
                .tabItem {

                    Label(
                        "Progresso",
                        systemImage: "chart.bar.fill"
                    )
                }
        }
    }
}
#Preview {

    MainTabView()
        .environmentObject(
            AppState()
        )
}
