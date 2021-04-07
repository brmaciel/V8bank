//
//  OBEnterLoginPasswordWorker.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

class OBEnterLoginPasswordWorker {
    
    func sendLoginForm(_ loginForm: LoginForm, completion: @escaping () -> Void, fail: @escaping () -> Void) {
        let requestForm = OBRestRequest(data: try? JSONEncoder().encode(loginForm),
                                        endpoint: OBRequestConfig.baseURL + "/login",
                                        headers: OBRequestConfig.headerJson,
                                        method: .post)
        OnboardingRequester.request(requestForm) { response in
            switch response.result {
                case .success:
                    loginForm.password != "000000" ? completion() : fail()
                default:
                    fail()
            }
        }
    }
}
