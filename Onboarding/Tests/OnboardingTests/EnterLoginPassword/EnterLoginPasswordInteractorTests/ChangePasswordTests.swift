//
//  ChangePasswordTests.swift
//  
//
//  Created by Bruno Maciel on 4/7/21.
//

import XCTest
@testable import Onboarding

final class ChangePasswordTests: XCTestCase {
    
    let interactor = OBEnterLoginPasswordInteractor(cpf: "12345678900")
    let deletingCharacterInput = ""
    let validInput = "9"
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // MARK: - Testing...
    
    /// Must ignore delete action when currentPassword is already empty
    func test_enterCharacter_deletingCharacterWithEmptyPassword() {
        interactor.currentPassword = ""
        
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: deletingCharacterInput)
        interactor.enterCharacter(request: request)
        
        XCTAssertEqual(interactor.currentPassword, "")
    }
    
    /// Must remove last character
    func test_enterCharacter_deletingCharacter() {
        interactor.currentPassword = "1234"
        
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: deletingCharacterInput)
        interactor.enterCharacter(request: request)
        
        XCTAssertNotEqual(interactor.currentPassword, "")
        XCTAssertEqual(interactor.currentPassword, "123")
    }
    
    /// Must ignore any input which is not a number
    func test_enterCharacter_enterNonNumberCharacter() {
        let currentPassword = "1234"
        interactor.currentPassword = currentPassword
        let letterInput = "a"
        
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: letterInput)
        interactor.enterCharacter(request: request)
        
        XCTAssertFalse(interactor.currentPassword.contains(letterInput))
        XCTAssertEqual(interactor.currentPassword, currentPassword)
    }
    
    /// Must ignore input with more than 1 character
    func test_enterCharacter_enterMoreThanOneCharacter() {
        let currentPassword = "1234"
        interactor.currentPassword = currentPassword
        let moreThanOneCharInput = "99"
        
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: moreThanOneCharInput)
        interactor.enterCharacter(request: request)
        
        XCTAssertEqual(interactor.currentPassword, currentPassword)
    }
    
    /// Must ignore input when limit digits is reached
    func test_enterCharacter_enterCharAfterPasswordIfFull() {
        let currentPassword = "123456"
        interactor.currentPassword = currentPassword
        
        XCTAssertEqual(interactor.currentPassword.count, interactor.passwordLimitDigits)
        
        
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: validInput)
        interactor.enterCharacter(request: request)
        
        XCTAssertEqual(interactor.currentPassword, currentPassword)
    }
    
    /// Must add character in last position
    func test_enterCharacter_enterValidCharacter() {
        let currentPassword = "1234"
        interactor.currentPassword = currentPassword
        
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: validInput)
        interactor.enterCharacter(request: request)
        
        XCTAssertEqual(interactor.currentPassword, currentPassword + validInput)
    }
}
