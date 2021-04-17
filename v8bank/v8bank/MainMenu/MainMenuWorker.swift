//
//  MainMenuWorker.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import Foundation

class MainMenuWorker {
    
    func getBalances(completion: @escaping ([BalancesStruct]) -> Void, fail: @escaping () -> Void) {
        let requestForm = V8RestRequest(data: nil,
                                        endpoint: V8RequestConfig.baseURL + "/balances",
                                        headers: V8RequestConfig.headerJson,
                                        method: .get)
        
        V8Requester.request(requestForm) { response in
            switch response.result {
                case .success:
//                    guard
//                        let data = response.data,
//                        let object = try? JSONDecoder().decode([BalancesStruct].self, from: data)
//                        else { fail(); return }
                    
                    let object = [
                        BalancesStruct(balanceType: 1, amount: 12345.67),
                        BalancesStruct(balanceType: 2, amount: 44.59)
                    ]
                    completion(object)
                default:
                    fail()
            }
        }
    }
    
}

struct BalancesStruct: Decodable {
    let balanceType: Int
    let amount: Double
}
