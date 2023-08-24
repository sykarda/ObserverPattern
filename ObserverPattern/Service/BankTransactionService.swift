//
//  BankTransactionService.swift
//  ObserverPattern
//
//  Created by Arda Ilgili on 10.08.2023.
//

import Foundation

enum ObserverType {
    case notificationCenterObserver
    case protocolBasedObserver
}

class BankTransactionService {
    var transactions = [Transaction]()
    var observer: TransactionObserver?

    static let shared = BankTransactionService()

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: fetchTransactions)
    }

    func fetchTransactions() {
        // Mock transaction
        let newTransaction = Transaction(type: .incoming, amount: Double.random(in: 1.0...100.0))
        newTransactionArrived(newTransaction, observerType: .protocolBasedObserver)
    }

    private func newTransactionArrived(_ transaction: Transaction, observerType: ObserverType) {
        transactions.append(transaction)

        switch observerType {
        case .notificationCenterObserver:
            NotificationCenter.default.post(name: NSNotification.Name("NEW-TRANSACTION"), object: transaction)
        case .protocolBasedObserver:
            observer?.transactionArrived(with: transaction)
        }
    }

}

extension BankTransactionService {
    func setObserver(with observer: TransactionObserver) {
        self.observer = observer
    }
}
