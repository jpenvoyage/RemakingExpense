//
//  ExpensesViewModel.swift
//  RemakingExpense
//
//  Created by Joao Leal on 3/14/24.
//

import Foundation
import Observation

@Observable
class ExpensesViewModel {
    var expenses = [Expense]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(expenses) {
                UserDefaults.standard.set(encoded, forKey: "Expenses")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Expenses") {
            if let decodedExpenses = try? JSONDecoder().decode([Expense].self, from: savedItems) {
                expenses = decodedExpenses
                return
            }
        }
        expenses = []
    }
}
