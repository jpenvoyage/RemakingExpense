//
//  ContentView.swift
//  RemakingExpense
//
//  Created by Joao Leal on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    
    var expenses = ExpensesViewModel()
    @State private var showingExpenseView = false
    
    var body: some View {
 NavigationStack {
            List{
                ForEach(expenses.expenses) { item in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                
                .onDelete(perform: removeItems)
                
                
            }.navigationTitle("XXXpenses")
         .toolbar {
             Button("Add", systemImage: "plus") {
                 showingExpenseView = true
             }.sheet(isPresented: $showingExpenseView){
                 AddView(expenses: expenses)
         }
         }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.expenses.remove(atOffsets: offsets)
    }
    
}
#Preview {
    ContentView()
}
