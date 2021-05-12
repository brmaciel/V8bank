//
//  TRStatementEntities.swift
//  
//
//  Created by Bruno Maciel on 4/29/21.
//

import Foundation

struct TRStatement: Decodable {
    var balance: Double
    var items: [TRStatementGroupDate]
}

struct TRStatementGroupDate: Decodable {
    var date: String
    var items: [TRStatementItem]
}

struct TRStatementItem: Decodable {
    var title: String
    var subtitle: String
    var value: Double
    var time: String
}
