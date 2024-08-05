//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Oliver Hu on 2/1/24.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
