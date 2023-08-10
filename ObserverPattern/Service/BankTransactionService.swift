//
//  BankTransactionService.swift
//  ObserverPattern
//
//  Created by Arda Ilgili on 10.08.2023.
//

import Foundation

class BankTransactionService {
    var transactions = [Transaction]()

    static let shared = BankTransactionService()

    func fetchTransactions() {
        // Mock transaction
        let newTransaction = Transaction(type: .incoming, amount: Double.random(in: 1.0...100.0))
        transactions.append(newTransaction)
    }

    private func newTransactionAdded(_ transaction: Transaction) {
        NotificationCenter.default.post(name: NSNotification.Name("newTransaction"), object: transaction)
    }
}
