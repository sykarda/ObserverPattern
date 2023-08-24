//
//  TransactionObserver.swift
//  ObserverPattern
//
//  Created by Arda Ilgili on 24.08.2023.
//

import Foundation

protocol TransactionObserver {
    func transactionArrived(with transaction: Transaction)
}
