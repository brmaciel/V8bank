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

                    let object = TRStatement(balance: 123456.78, items: [
                        TRStatementItem(title: "title 1", subtitle: "subtitle 1", date: "2021-04-05", value: 34),
                        TRStatementItem(title: "title 2", subtitle: "subtitle 2", date: "2021-03-04", value: 23),
                        TRStatementItem(title: "title 3", subtitle: "subtitle 3", date: "2021-02-03", value: 12)
                    ])
                    completion(object)
                default:
                    fail()
            }
        }
    }
    
}

struct TRStatement: Decodable {
    var balance: Double
    var items: [TRStatementItem]
}

struct TRStatementItem: Decodable {
    var title: String
    var subtitle: String
    var date: String
    var value: Double
}
