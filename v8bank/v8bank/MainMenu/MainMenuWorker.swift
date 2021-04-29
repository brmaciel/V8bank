//
//  MainMenuWorker.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit
import Transactions

class MainMenuWorker {
    
    func getBalances(completion: @escaping (BalancesResponse) -> Void, fail: @escaping () -> Void) {
        let requestForm = V8RestRequest(data: nil,
                                        endpoint: V8RequestConfig.baseURL + "/balances",
                                        headers: V8RequestConfig.headerJson,
                                        method: .get)
        
        V8Requester.request(requestForm) { response in
            switch response.result {
                case .success:
//                    guard
//                        let data = response.data,
//                        let object = try? JSONDecoder().decode(BalancesResponse.self, from: data)
//                        else { fail(); return }
                    
                    let object = BalancesResponse(statement: StatementBalance(amount: 12345.67), creditCard: CreaditCardBalance(amount: 44.59), investiment: InvestimentBalance(amount: 404.59))
                    completion(object)
                default:
                    fail()
            }
        }
    }
    
}


struct BalancesResponse: Decodable {
    let statement: StatementBalance?
    let creditCard: CreaditCardBalance?
    let investiment: InvestimentBalance?
    
    var isEmpty: Bool { return statement == nil && creditCard == nil && investiment == nil }
    var allBalances: [BalanceProtocol] {
        var balances: [BalanceProtocol] = []
        if let statement = self.statement { balances.append(statement) }
        if let creditCard = self.creditCard { balances.append(creditCard) }
        if let investiment = self.investiment { balances.append(investiment) }
        return balances
    }
}

struct StatementBalance: BalanceProtocol, Decodable {
    let title = "Saldo"
    let actionName = "EXTRATO"
    let action: () -> UIViewController = BankStatementRouter.createModule
    
    let amount: Double
    
    fileprivate init(amount: Double) {
        self.amount = amount
    }
    
    
    // Decoding
    enum DecodKeys: String, CodingKey {
        case amount
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: DecodKeys.self)
        
        let balance = try? container.decode(Double.self, forKey: .amount)
        self.amount = balance ?? 0
    }
}

struct CreaditCardBalance: BalanceProtocol, Decodable {
    let title = "Fatura Atual"
    let actionName = "FATURA"
    let action: () -> UIViewController = BankStatementRouter.createModule
    
    let amount: Double
    
    fileprivate init(amount: Double) {
        self.amount = amount
    }
    
    
    // Decoding
    enum DecodKeys: String, CodingKey {
        case amount
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: DecodKeys.self)
        
        let balance = try? container.decode(Double.self, forKey: .amount)
        self.amount = balance ?? 0
    }
}

struct InvestimentBalance: BalanceProtocol, Decodable {
    let title = "Investimentos"
    let actionName = "DETALHES"
    let action: () -> UIViewController = BankStatementRouter.createModule
    
    let amount: Double
    
    fileprivate init(amount: Double) {
        self.amount = amount
    }
    
    
    // Decoding
    enum DecodKeys: String, CodingKey {
        case amount
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: DecodKeys.self)
        
        let balance = try? container.decode(Double.self, forKey: .amount)
        self.amount = balance ?? 0
    }
}


protocol BalanceProtocol {
    var title: String { get }
    var actionName: String { get }
    var action: () -> UIViewController { get }
    var amount: Double { get }
}
