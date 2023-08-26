//
//  ViewController.swift
//  ObserverPattern
//
//  Created by Arda Ilgili on 10.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(newTransactionHasArrived), name: NSNotification.Name("NEW-TRANSACTION"), object: nil)

        BankTransactionService.shared.setObserver(with: self)

        BankTransactionService.shared.addNewClosureObserver { transaction in
            self.present(self.createAlert(with: transaction), animated: true)
        }

        BankTransactionService.shared.fetchTransactions()
    }

    @objc private func newTransactionHasArrived(_ notification: Notification) {
        print("New Transaction Arriverd")
        guard let transaction = notification.object as? Transaction else { return }
        self.present(createAlert(with: transaction), animated: true)
    }

    private func createAlert(with transaction: Transaction) -> UIAlertController {
        let title = transaction.type == .incoming ? "Incoming money" : "Outgoing money"
        let message = transaction.type == .incoming ? "You have money 😁" : "You lost money 😕"
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }

}

extension MainViewController: TransactionObserver {
    func transactionArrived(with transaction: Transaction) {
        self.present(createAlert(with: transaction), animated: true)
    }
}

