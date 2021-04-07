//
//  NewLoginInteractor.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

class NewLoginInteractor {
    
    var presenter: NewLoginPresenterProtocol?
    var router: NewLoginRouter?
    
    
    enum ValidationError: Error {
        case emptyCPF, invalidCPF
    }
    
    
    // MARK: - Methods
    
    func validateCPF(_ cpfString: String?) throws -> String {
        guard
            let cpfString = cpfString,
            !cpfString.isEmpty
            else { throw ValidationError.emptyCPF }
        
        var validCPF = cpfString.replacingOccurrences(of: ".", with: "")
        validCPF = validCPF.replacingOccurrences(of: "-", with: "")
        
        
        // Check if has 11 digits only
        guard
            validCPF.count == 11,
            validCPF.filter( { Int(String($0)) != nil} ).count == 11
        else { throw ValidationError.invalidCPF }
        
        
        // Check if digits are not all equal
        for i in 1..<validCPF.count {
            if validCPF.at(i) != validCPF.at(0) { break }
            else if i == validCPF.count - 1 { throw ValidationError.invalidCPF }
        }
        
        var digitsArray: [Int] = validCPF.map { Int(String($0))! }
        let digit2 = digitsArray.removeLast()
        let digit1 = digitsArray.removeLast()
        
        
        // Validation 1st digit
        var multiplier = 11
        var sumDigits = digitsArray.reduce(0) {
            multiplier -= 1
            return $0 + $1 * multiplier
        }
        var resultDigit = sumDigits * 10 % 11
        if resultDigit >= 10 { resultDigit = 0 }
        guard resultDigit == digit1 else { throw ValidationError.invalidCPF }
        
        
        // Validation 2nd digit
        digitsArray.append(digit1)
        multiplier = 12
        sumDigits = digitsArray.reduce(0) {
            multiplier -= 1
            return $0 + $1 * multiplier
        }
        resultDigit = sumDigits * 10 % 11
        if resultDigit >= 10 { resultDigit = 0 }
        guard resultDigit == digit2 else { throw ValidationError.invalidCPF }
        
        
        return cpfString
    }
    
}


// MARK: - Access from View
extension NewLoginInteractor: NewLoginInteractorProtocol {
    func validateInput(request: NewLoginModels.Request) {
        do {
            _ = try validateCPF(request.cpf)
            presenter?.presentValidCPF()
        }
        catch ValidationError.emptyCPF { presenter?.presentEmptyCPF() }
        catch ValidationError.invalidCPF { presenter?.presentInvalidCPF() }
        catch {}
    }
    
    func enter(request: NewLoginModels.Request) {
        do {
            let validCPF = try validateCPF(request.cpf)
            
            let dataStore = NewLoginModels.DataStore(cpf: validCPF)
            router?.proceedWithLoginProcess(data: dataStore)
        }
        catch ValidationError.emptyCPF { presenter?.presentEmptyCPF() }
        catch ValidationError.invalidCPF { presenter?.presentInvalidCPF() }
        catch {}
    }
    
    func closeScreen() {
        router?.dismissView()
    }
}
