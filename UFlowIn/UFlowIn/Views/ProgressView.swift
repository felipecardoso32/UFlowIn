//
//  ProgressView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI
import Charts

struct ProgressView: View {

    enum Period: String, CaseIterable {

        case day = "Dia"
        case week = "Semana"
        case month = "Mês"
    }

    @State private var selectedPeriod:
        Period = .week

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: 24
                ) {

                    Text("Seu progresso")
                        .font(.largeTitle.bold())

                    Picker(
                        "Período",
                        selection:
                            $selectedPeriod
                    ) {

                        ForEach(
                            Period.allCases,
                            id: \.self
                        ) { period in

                            Text(
                                period.rawValue
                            )
                            .tag(period)
                        }
                    }
                    .pickerStyle(.segmented)

                    Text(
                        "Atividade física"
                    )
                    .font(.title2.bold())

                    Chart {

                        ForEach(
                            chartData,
                            id: \.day
                        ) { item in

                            BarMark(
                                x: .value(
                                    "Dia",
                                    item.day
                                ),
                                y: .value(
                                    "Minutos",
                                    item.value
                                )
                            )
                        }
                    }
                    .frame(height: 220)

                    StatCard(
                        title: "Calorias",
                        value: "1.450 kcal"
                    )

                    StatCard(
                        title: "Tempo de atividade",
                        value: "120 minutos"
                    )
                }
                .padding(24)
            }
            .navigationTitle("Progresso")
        }
    }

    private var chartData:
        [(day: String, value: Int)] {

        switch selectedPeriod {

        case .day:

            return [
                ("08h", 20),
                ("12h", 30),
                ("16h", 15),
                ("20h", 40)
            ]

        case .week:

            return [
                ("Seg", 30),
                ("Ter", 45),
                ("Qua", 20),
                ("Qui", 60),
                ("Sex", 40),
                ("Sáb", 70),
                ("Dom", 50)
            ]

        case .month:

            return [
                ("1", 40),
                ("5", 60),
                ("10", 30),
                ("15", 80),
                ("20", 50),
                ("25", 90),
                ("30", 70)
            ]
        }
    }
}
#Preview {

    ProgressView()
        .environmentObject(
            AppState()
        )
}
