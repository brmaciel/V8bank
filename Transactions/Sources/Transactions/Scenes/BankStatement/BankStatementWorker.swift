//
//  BankStatementWorker.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import Foundation

class BankStatementWorker {
    
    func getStatement(completion: @escaping (TRStatement) -> Void, fail: @escaping () -> Void) {
        let requestForm = TRRestRequest(data: nil,
                                        endpoint: TRRequestConfig.baseURL + "/statement",
                                        headers: TRRequestConfig.headerJson,
                                        method: .get)

        TRRequester.request(requestForm) { response in
            switch response.result {
                case .success:
//                    guard
//                        let data = response.data,
//                        let object = try? JSONDecoder().decode(TRStatement.self, from: data)
//                        else { fail(); return }
                    
                    let object = (Int.random(in: 1...3) > 1) ? self.mockStatement() : TRStatement(balance: 123456.78, items: [])
                    completion(object)
                default:
                    fail()
            }
        }
    }
    
    
    // MARK: - Mocks
    private func mockStatement() -> TRStatement {
        return TRStatement(balance: 123456.78, items: [
            TRStatementGroupDate(date: "2021-04-08", items: [
                TRStatementItem(title: "Payment", subtitle: "Payment 05", value: -71.83),
                TRStatementItem(title: "Income", subtitle: "Income 08", value: 897.10),
                TRStatementItem(title: "Income", subtitle: "Income 07", value: 9.50)
                ]),
            TRStatementGroupDate(date: "2021-04-05", items: [
                TRStatementItem(title: "Payment", subtitle: "Payment 04", value: -41.23),
                TRStatementItem(title: "Income", subtitle: "Income 06", value: 89.0),
                TRStatementItem(title: "Income", subtitle: "Income 05", value: 49.50)
                ]),
            TRStatementGroupDate(date: "2021-04-01", items: [
                TRStatementItem(title: "Transfer", subtitle: "Transfer 03", value: -123.0),
                TRStatementItem(title: "Income", subtitle: "Income 04", value: 4567.98),
                TRStatementItem(title: "Payment", subtitle: "Payment 03", value: -11.22),
                TRStatementItem(title: "Income", subtitle: "Income 03", value: 76.45),
                TRStatementItem(title: "Income", subtitle: "Income 02", value: 12),
                TRStatementItem(title: "Payment", subtitle: "Payment 02", value: -14.23)
                ]),
            TRStatementGroupDate(date: "2021-03-28", items: [
                TRStatementItem(title: "Transfer", subtitle: "Transfer 02", value: -23.40),
                TRStatementItem(title: "Payment", subtitle: "Payment 01", value: -7.99),
                TRStatementItem(title: "Transfer", subtitle: "Transfer 01", value: -12.78),
                TRStatementItem(title: "Income", subtitle: "Income 01", value: 12367.78)
                ])
        ])
    }
}
