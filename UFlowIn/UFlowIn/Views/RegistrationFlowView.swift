//
//  RegistrationFlowView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct RegistrationFlowView: View {

    @State private var currentPage = 0

    private let totalPages = 5

    var body: some View {

        VStack {

        

            Group {

                switch currentPage {

                case 0:

                    PermissionsView {

                        withAnimation {

                            currentPage += 1
                        }
                    }


                case 1:

                    AboutYouView {

                        withAnimation {

                            currentPage += 1
                        }
                    }


                case 2:

                    GoalsView {

                        withAnimation {

                            currentPage += 1
                        }
                    }


                case 3:

                    ActivityLevelView {

                        withAnimation {

                            currentPage += 1
                        }
                    }


                case 4:

                    FavoriteActivitiesView {

                        withAnimation {

                            currentPage += 1
                        }
                    }


                default:

                    RegistrationFinishView()
                }
            }


            // MARK: - Progress Dots

            if currentPage < totalPages {

                ProgressDots(
                    currentPage: currentPage,
                    totalPages: totalPages
                )
                .padding(.bottom, 20)
            }
        }
    }
}


#Preview {

    RegistrationFlowView()
        .environmentObject(
            AppState()
        )
}
