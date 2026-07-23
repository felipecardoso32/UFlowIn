//
//  EditprofileView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct EditProfileView: View {

    @Environment(\.dismiss)
    private var dismiss

    @State private var name = "Felipe"
    @State private var age = "25"
    @State private var weight = "70"
    @State private var height = "175"

    var body: some View {

        NavigationStack {

            Form {

                Section("Dados pessoais") {

                    TextField(
                        "Nome",
                        text: $name
                    )

                    TextField(
                        "Idade",
                        text: $age
                    )
                    .keyboardType(.numberPad)

                    TextField(
                        "Peso",
                        text: $weight
                    )
                    .keyboardType(.decimalPad)

                    TextField(
                        "Altura",
                        text: $height
                    )
                    .keyboardType(.numberPad)
                }

                Button("Salvar") {

                    dismiss()
                }
            }
            .navigationTitle(
                "Editar informações"
            )
        }
    }
}
#Preview {

    EditProfileView()
        .environmentObject(
            AppState()
        )
}
