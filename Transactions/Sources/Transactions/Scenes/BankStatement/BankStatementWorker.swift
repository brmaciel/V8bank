//
//  BankStatementWorker.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import Foundation

class BankStatementWorker {
    
    func getStatement(completion: @escaping ([String]) -> Void, fail: @escaping () -> Void) {
//        let requestForm = V8RestRequest(data: nil,
//                                        endpoint: V8RequestConfig.baseURL + "/balances",
//                                        headers: V8RequestConfig.headerJson,
//                                        method: .get)
//
//        V8Requester.request(requestForm) { response in
//            switch response.result {
//                case .success:
////                    guard
////                        let data = response.data,
////                        let object = try? JSONDecoder().decode([BalancesStruct].self, from: data)
////                        else { fail(); return }
//
                    let object = ["", "", ""]
                    completion(object)
//                default:
//                    fail()
//            }
//        }
    }
    
}
