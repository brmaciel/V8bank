//
//  OnboardingRequester.swift
//  
//
//  Created by Bruno Maciel on 4/7/21.
//

import Foundation

struct OBRequestConfig {
    static var baseURL: String = "baseURL"
    
    static let headerJson: [String : String] = [
        "Authorization" : "Bearer TOKEN",
        "Content-Type" : "application/json"
    ]
}

/// Object to create API request
struct OBRestRequest {
    var data: Data?
    var endpoint: String
    var headers: [String: String]?
    var method: OnboardingRequester.HTTPMethod
}

/// Object to treat response from API independently of the library used to make request
struct RestResponse {
    enum APIError {
        case urlError
        case noResponse
        case responseStatusCode(code: Int)
    }
    
    enum ResponseResult {
        case success, failure(APIError)
    }
    var data: Data?
    var statusCode: Int
    var result: ResponseResult
}

class OnboardingRequester {
    private init() {}
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
        case head = "HEAD"
    }
    
    
    static func request(_ requestForm: OBRestRequest, completion: @escaping (RestResponse) -> Void) {
        var restResponse = RestResponse(data: nil, statusCode: 0, result: .success)
        
        
        // Create Url
        let completePath = requestForm.endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        guard let url = URL(string: completePath) else {
            print("\nError creating url")
            restResponse.result = .failure(.urlError)
            completion(restResponse)
            return }
        
        // Create Request
        var request = URLRequest(url: url)
        request.httpMethod = requestForm.method.rawValue
        if let body = requestForm.data { request.httpBody = body }
        request.allHTTPHeaderFields = requestForm.headers
        
        // Make Request
//        let dataTask = URLSession.shared.dataTask(with: request) { (responseData: Data?, urlResponse: URLResponse?, error: Error?) in
//            DispatchQueue.main.async {
//                // DataTask Error
//                if error != nil {
//                    restResponse.result = .failure(.noResponse)
//                    completion(restResponse)
//                    return }
//
//                // No-Response Error
//                guard let httpResponse = urlResponse as? HTTPURLResponse else {
//                    restResponse.result = .failure(.noResponse)
//                    completion(restResponse)
//                    return }
//
//                restResponse.data = responseData
//                restResponse.statusCode = httpResponse.statusCode
//
//                // Status Code != 2xx
//                let statusCode_2xx = 200...299
//                guard statusCode_2xx.contains(restResponse.statusCode) else {
//                    restResponse.result = .failure(.responseStatusCode(code: restResponse.statusCode))
//                    completion(restResponse)
//                    return }
//
//                restResponse.result = .success
//                completion(restResponse)
//            }
//        }
//        dataTask.resume()
        
        // Mock Request
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                completion(restResponse)
            }
        }
    }
}


extension Data {
    func printContent() {
        if let JSONString = String(data: self, encoding: .utf8) {
            print(JSONString)
        }
    }
}
