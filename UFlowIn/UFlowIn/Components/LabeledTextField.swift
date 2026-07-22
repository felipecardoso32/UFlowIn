//
//  LabeledTextField.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

/// Standard labeled text field, e.g. "Email" / "exemplo@email.com".
struct LabeledTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var icon: String? = nil
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: TextInputAutocapitalization = .sentences

    @State private var isSecureVisible = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 4) {
                if let icon { Image(systemName: icon).font(.caption).foregroundColor(.labelsVibCTRL2) }
                Text(label)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.labelsVibCTRL2)
            }
            HStack {
                Group {
                    if isSecure && !isSecureVisible {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .keyboardType(keyboardType)
                .textInputAutocapitalization(autocapitalization)
                .autocorrectionDisabled(keyboardType != .default)

                if isSecure {
                    Button { isSecureVisible.toggle() } label: {
                        Image(systemName: isSecureVisible ? "eye.slash" : "eye")
                            .foregroundColor(.labelsVibCTRL2)
                    }
                }
            }
            .padding(.horizontal, 14)
            .frame(height: 44) // frame editado
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.labelsPrimary, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

/// Compact numeric field with a trailing unit label, used for Idade/Peso/Altura
/// in the "Conhecendo você" screen. Restricts input to digits (and one comma for decimals).
struct UnitTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    let unit: String
    var allowsDecimal: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.labelsVibCTRL2)
            HStack {
                TextField(placeholder, text: $text)
                    .keyboardType(allowsDecimal ? .decimalPad : .numberPad)
                    .onChange(of: text) { _, newValue in
                        text = sanitize(newValue)
                    }
                Text(unit)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.labelsVibCTRL2)
            }
            .padding(.horizontal, 14)
            .frame(height: 44) // frame editado
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Theme.stroke, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private func sanitize(_ value: String) -> String {
        let allowed = allowsDecimal ? "0123456789," : "0123456789"
        var result = value.filter { allowed.contains($0) }
        // Only one comma allowed
        if allowsDecimal, result.filter({ $0 == "," }).count > 1 {
            if let firstIndex = result.firstIndex(of: ",") {
                let after = result.index(after: firstIndex)
                result = String(result[..<after]) + result[after...].replacingOccurrences(of: ",", with: "")
            }
        }
        return result
    }
}

/// Dropdown-style menu used for Gender selection ("Selecione" -> Masculino/Feminino/Outro).
struct GenderMenuField: View {
    let label: String
    @Binding var selection: Gender?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.labelsVibCTRL2)
            Menu {
                ForEach(Gender.allCases) { gender in
                    Button(gender.rawValue) { selection = gender }
                }
            } label: {
                HStack {
                    Text(selection?.rawValue ?? "Selecione")
                        .foregroundColor(selection == nil ? .labelsVibCTRL2.opacity(0.7) : .labelsPrimary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .foregroundColor(.labelsVibCTRL2)
                }
                .padding(.horizontal, 14)
                .frame(height: 44)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(.labelsPrimary, lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
