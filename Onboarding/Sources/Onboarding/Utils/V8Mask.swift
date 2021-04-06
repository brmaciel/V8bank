//
//  V8Mask.swift
//  
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class V8Mask {
    enum MaskStyle: String {
        case cpf = "000.000.000-00"
        
        var limitDigits: Int {
            return self.rawValue.onlyNumbers.count
        }
    }
    
    // Error
    fileprivate enum MaskError: Error {
        case indexOutOfRange(String)
    }
    
    // MARK: Properties
    fileprivate weak var textField: UITextField!
    fileprivate var maskType: MaskStyle!
    
    
    // MARK: Constructor
    init(_ textField: UITextField, as maskStyle: MaskStyle) {
        self.textField = textField
        self.maskType = maskStyle
    }
    
    
    // MARK: - Public Methods
    
    func shouldChangeCharacters(at location: Int, inputString string: String) -> Bool {
        do {
            let shouldChange = try changeText(string.onlyNumbers, at: location)
            return shouldChange
        }
        catch MaskError.indexOutOfRange(let message) { print(message) }
        catch {}
        
        return true
    }
    
    
    // MARK: - Private Methods
    
    fileprivate func changeText(_ inputString: String, at index: Int) throws -> Bool {
        // Excluindo caracter
        if inputString == "" { return true }

        // Inserindo um caracter
        var currentText = self.textField.text ?? ""
        if index > currentText.count { throw MaskError.indexOutOfRange("Index out of range: Mask")  }
        
        let currentTextSize = currentText.onlyNumbers.count
        
        if currentTextSize < self.maskType.limitDigits {
            if inputString.count == 1 {
                currentText.insert(inputString, at: index)
            }
            else {
                let digitsLeft = self.maskType.limitDigits - currentTextSize
                currentText.insert(String(inputString.prefix(digitsLeft)), at: index)
            }
        }
        currentText = currentText.onlyNumbers
        
        // Aplica a mask
        self.textField.text = V8Mask.mask(currentText, as: self.maskType)
        
        if currentText.count == self.maskType.limitDigits { self.textField.resignFirstResponder() }
        
        return false
    }
    
    
    // MARK: Static Methods
    static func mask(_ str: String, as maskFormat: MaskStyle) -> String {
        var string: String = str
        if str.count > maskFormat.limitDigits {
            string = String(str.prefix(maskFormat.limitDigits))
        }

        for (index, character) in maskFormat.rawValue.enumerated() {
            if character != "0" && index < string.count {
                string.insert(character, at: string.index(string.startIndex, offsetBy: index))
            }
        }
        return string
    }
    
}


/* ===== Extensions Needed ===== */
extension String {
    fileprivate var onlyNumbers: String {
        guard !isEmpty else { return "" }
        
        return replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: startIndex..<endIndex)
    }
    
    fileprivate mutating func insert(_ string: String, at index: Int) {
        self.insert(contentsOf: string, at: self.index(self.startIndex, offsetBy: index))
    }
}
