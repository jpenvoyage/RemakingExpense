//
//  AddView.swift
//  RemakingExpense
//
//  Created by Joao Leal on 3/14/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0
    
    let types = ["Business", "Personal"]
    
    var expenses: ExpensesViewModel
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name of expense", text: $name)
                
                Picker("Select type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                    }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                }.navigationTitle("Add Expense")
                    .toolbar {
                        Button("Save" ) {
                            let expense = Expense(name: name, type: type, amount: amount)
                            expenses.expenses.append(expense)
                            dismiss()
                        }
                    }
            }
        }
    }


#Preview {
    AddView(expenses: ExpensesViewModel())
}
