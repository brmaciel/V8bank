//
//  ValidateCpfTests.swift
//  
//
//  Created by Bruno Maciel on 4/7/21.
//

import XCTest
@testable import Onboarding

final class ValidateCpfTests: XCTestCase {
    
    let interactor = NewLoginInteractor()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // MARK: - Validation MUST FAIL
        
    func test_validateCPF_nilCPF() {
        let nilCPF: String? = nil
        
        XCTAssertThrowsError(try interactor.validateCPF(nilCPF)) { error in
            XCTAssertEqual(error as! NewLoginInteractor.ValidationError, NewLoginInteractor.ValidationError.emptyCPF)
        }
    }
    
    func test_validateCPF_emptyCPF() {
        let emptyCPF: String? = ""
        
        XCTAssertThrowsError(try interactor.validateCPF(emptyCPF)) { error in
            XCTAssertEqual(error as! NewLoginInteractor.ValidationError, NewLoginInteractor.ValidationError.emptyCPF)
        }
    }
    
    func test_validateCPF_invalidCPF() {
        let invalidCPF: String? = "    "
        let invalidCPF2: String? = "12345678900"
        let invalidCPF3: String? = "11111111111"
        let invalidCPF4: String? = "165.401.980-19a"
        
        XCTAssertThrowsError(try interactor.validateCPF(invalidCPF)) { error in
            XCTAssertEqual(error as! NewLoginInteractor.ValidationError, NewLoginInteractor.ValidationError.invalidCPF)
        }
        
        XCTAssertThrowsError(try interactor.validateCPF(invalidCPF2)) { error in
            XCTAssertEqual(error as! NewLoginInteractor.ValidationError, NewLoginInteractor.ValidationError.invalidCPF)
        }
        
        XCTAssertThrowsError(try interactor.validateCPF(invalidCPF3)) { error in
            XCTAssertEqual(error as! NewLoginInteractor.ValidationError, NewLoginInteractor.ValidationError.invalidCPF)
        }
        
        XCTAssertThrowsError(try interactor.validateCPF(invalidCPF4)) { error in
            XCTAssertEqual(error as! NewLoginInteractor.ValidationError, NewLoginInteractor.ValidationError.invalidCPF)
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validateUsername_validCPF_withPunctuation() {
        let validCPF_withPunctuation: String? = "165.401.980-19"
        
        XCTAssertNoThrow(try interactor.validateCPF(validCPF_withPunctuation))
    }
    
    func test_validateUsername_validCPF_noPunctuation() {
        let validCPF_noPunctuation: String? = "16540198019"
        
        XCTAssertNoThrow(try interactor.validateCPF(validCPF_noPunctuation))
    }
    
}
