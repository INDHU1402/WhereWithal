//
//  AddExpense.swift
//  WhereWithal
//
//  Created by Indhu on 11/07/24.
//

import SwiftUI

struct AddExpense: View {
    @State private var showingPopover = false

        var body: some View {
            Button("Show Menu") {
                showingPopover = true
            }
            .popover(isPresented: $showingPopover) {
                Text("Your content here")
                    .font(.headline)
                    .padding()
            }
        }
}

#Preview {
    AddExpense()
}
