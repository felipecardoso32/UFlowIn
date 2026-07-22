//
//  SelectableOptionsRow.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

/// Selectable row used for "Objetivos" and "Atividades Favoritas" (multi-select)
/// and "Nível de Atividade" (single-select, handled by the parent view passing
/// only one selected id at a time).
///
/// When selected: shows a filled checkmark bubble and a blue (Theme.primary) stroke,
/// matching the reference video/screens.
struct SelectableOptionRow: View {
    let title: String
    var subtitle: String? = nil
    var icon: String? = nil
    let isSelected: Bool
    var style: Style = .checkbox
    let action: () -> Void

    enum Style { case checkbox, radio }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                if let icon {
                    Image(systemName: icon)
                        .font(.system(size: 18))
                        .foregroundColor(isSelected ? .labelsPrimary : .labelsVibCTRL2)
                        .frame(width: 28)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.labelsPrimary)
                    if let subtitle {
                        Text(subtitle)
                            .font(.system(size: 12))
                            .foregroundColor(.labelsVibCTRL2)
                    }
                }
                Spacer()
                selectionMark
            }
            .padding(.horizontal, 14)
            .frame(height: subtitle == nil ? 52 : 64)
            .background(isSelected ? .labelsPrimary.opacity(0.06) : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isSelected ? .labelsPrimary : .labelsPrimary, lineWidth: isSelected ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private var selectionMark: some View {
        switch style {
        case .checkbox:
            ZStack {
                Circle().fill(isSelected ? .labelsPrimary : Color.clear)
                Circle().stroke(isSelected ? .labelsPrimary : .labelsPrimary, lineWidth: 1.5)
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 22, height: 22)
        case .radio:
            ZStack {
                Circle().stroke(isSelected ? .labelsPrimary : .labelsPrimary, lineWidth: 2)
                if isSelected {
                    Circle().fill(.labelsPrimary).frame(width: 12, height: 12)
                }
            }
            .frame(width: 22, height: 22)
        }
    }
}
