//
//  Expense.swift
//  RemakingExpense
//
//  Created by Joao Leal on 3/14/24.
//

import Foundation

struct Expense: Identifiable, Codable   {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
