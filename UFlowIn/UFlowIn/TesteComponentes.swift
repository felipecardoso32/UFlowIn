//
//  TesteComponentes.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct TesteComponentes: View {
    var body: some View {
        /*Circle()
            .stroke(
                AngularGradient(
                    stops: [
                        .init(color: Color(red: 0.31, green: 0.55, blue: 1.0), location: 0.0),
                        .init(color: Color(red: 0.31, green: 0.70, blue: 0.90), location: 0.25),
                        .init(color: Color(red: 0.30, green: 0.85, blue: 0.65), location: 0.50),
                        .init(color: Color(red: 0.30, green: 0.75, blue: 0.80), location: 0.75),
                        .init(color: Color(red: 0.31, green: 0.55, blue: 1.0), location: 1.0)
                    ],
                    center: .center,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(270)
                ),
                lineWidth: 16
            )
            .frame(width: 308, height: 308)*/
        Circle()
            .stroke(
                AngularGradient(
                    stops: [
                        .init(
                            color: Color(red: 0.31, green: 0.55, blue: 1.0),
                            location: 0.00
                        ),
                        .init(
                            color: Color(red: 0.31, green: 0.55, blue: 1.0),
                            location: 0.15
                        ),
                        .init(
                            color: Color(red: 0.30, green: 0.78, blue: 0.85),
                            location: 0.35
                        ),
                        .init(
                            color: Color(red: 0.30, green: 0.85, blue: 0.65),
                            location: 0.55
                        ),
                        .init(
                            color: Color(red: 0.30, green: 0.85, blue: 0.65),
                            location: 0.75
                        ),
                        .init(
                            color: Color(red: 0.30, green: 0.70, blue: 0.90),
                            location: 0.90
                        ),
                        .init(
                            color: Color(red: 0.31, green: 0.55, blue: 1.0),
                            location: 1.00
                        )
                    ],
                    center: .center,
                    startAngle: .degrees(180),
                    endAngle: .degrees(540)
                ),
                lineWidth: 16
            )
            .frame(width: 308, height: 408)
    }
}

#Preview {
    TesteComponentes()
}
