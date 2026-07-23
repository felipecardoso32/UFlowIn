//
//  AboutYoutView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct AboutYouView: View {

    var onContinue: () -> Void

    @State private var name = ""
    @State private var age = ""
    @State private var weight = ""
    @State private var height = ""

    @State private var gender = "Selecione"

    let genders = [
        "Masculino",
        "Feminino",
        "Outro",
        "Prefiro não informar"
    ]

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Text("Conhecendo você")
                    .font(.largeTitle.bold())

                Text(
                    "Queremos conhecer um pouco mais sobre você."
                )
                .foregroundStyle(.secondary)

                CustomTextField(
                    title: "Nome",
                    text: $name
                )

                CustomTextField(
                    title: "Idade",
                    text: $age,
                    keyboardType: .numberPad
                )

                CustomTextField(
                    title: "Peso (kg)",
                    text: $weight,
                    keyboardType: .decimalPad
                )

                CustomTextField(
                    title: "Altura (cm)",
                    text: $height,
                    keyboardType: .numberPad
                )

                VStack(
                    alignment: .leading
                ) {

                    Text("Gênero")
                        .foregroundStyle(.secondary)

                    Menu {

                        ForEach(
                            genders,
                            id: \.self
                        ) { item in

                            Button(item) {

                                gender = item
                            }
                        }

                    } label: {

                        HStack {

                            Text(gender)

                            Spacer()

                            Image(
                                systemName:
                                    "chevron.down"
                            )
                        }
                        .padding()
                        .background(
                            Color.gray.opacity(0.08)
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 12
                            )
                        )
                    }
                }

                PrimaryButton(
                    title: "Continuar"
                ) {

                    onContinue()
                }
            }
            .padding(24)
        }
    }
}
