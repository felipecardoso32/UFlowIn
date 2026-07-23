//
//  ProfileView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct ProfileView: View {

    @State private var showEdit = false

    var body: some View {

        NavigationStack {

            List {

                Section("Informações") {

                    Label(
                        "Felipe",
                        systemImage: "person"
                    )

                    Label(
                        "25 anos",
                        systemImage: "calendar"
                    )

                    Label(
                        "70 kg",
                        systemImage: "scalemass"
                    )
                }

                Section {

                    Button(
                        "Editar informações"
                    ) {

                        showEdit = true
                    }
                }
            }
            .navigationTitle("Perfil")
            .sheet(
                isPresented: $showEdit
            ) {

                EditProfileView()
            }
        }
    }
}
#Preview {

    ProfileView()
        .environmentObject(
            AppState()
        )
}
