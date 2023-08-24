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

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: fetchTransactions)
    }

    func fetchTransactions() {
        // Mock transaction
        let newTransaction = Transaction(type: .outgoing, amount: Double.random(in: 1.0...100.0))
        addNewTransaction(newTransaction)
    }

    private func addNewTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
        NotificationCenter.default.post(name: NSNotification.Name("NEW-TRANSACTION"), object: transaction)
    }
}
