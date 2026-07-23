//
//  HomeView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct HomeView: View {

    @State private var showProfile = false
    @State private var showEditProfile = false

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: 24
                ) {

                    Text("Olá!")
                        .font(.largeTitle.bold())

                    Text(
                        "Pronto para continuar sua jornada?"
                    )
                    .foregroundStyle(.secondary)

                    Text("Resumo de hoje")
                        .font(.title2.bold())

                    HStack {

                        StatCard(
                            title: "Calorias",
                            value: "1.250 kcal"
                        )

                        StatCard(
                            title: "Passos",
                            value: "7.340"
                        )
                    }

                    Text("Sua hidratação")
                        .font(.title2.bold())

                    Text("1,05 L")
                        .font(.largeTitle.bold())

                    Spacer()
                }
                .padding(24)
            }
            .navigationTitle("UFlowIn")
            .toolbar {

                ToolbarItem(
                    placement: .topBarLeading
                ) {

                    Button {

                        showProfile = true

                    } label: {

                        Image(
                            systemName:
                                "person.circle"
                        )
                    }
                }

                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    Button {

                        showEditProfile = true

                    } label: {

                        Image(
                            systemName:
                                "pencil"
                        )
                    }
                }
            }
            .sheet(
                isPresented: $showProfile
            ) {

                ProfileView()
            }
            .sheet(
                isPresented: $showEditProfile
            ) {

                EditProfileView()
            }
        }
    }
}

struct StatCard: View {

    let title: String
    let value: String

    var body: some View {

        VStack(
            alignment: .leading
        ) {

            Text(title)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.headline)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding()
        .background(
            Color.gray.opacity(0.08)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16
            )
        )
    }
}
#Preview {

    HomeView()
        .environmentObject(
            AppState()
        )
}
