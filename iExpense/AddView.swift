//
//  AddView.swift
//  iExpense
//
//  Created by Oliver Hu on 2/6/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses

    let types = ["Business", "Personal"]
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        //        NavigationStack {
        Form {
                            TextField("Name", text: $name)
            
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
            
            TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                .keyboardType(.decimalPad)
        }
        .navigationTitle("Add new expense")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        //        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
