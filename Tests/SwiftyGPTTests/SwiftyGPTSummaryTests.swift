//
//  SwiftyGPTSummaryTests.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTSummaryTests: SwiftyGPTTestCase {
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        
        let text = """
            La mia istruttrice di nuoto Elke W. aveva un cane barbone bianco, piuttosto grande per la sua razza, di nome Martino. Lei stessa ammetteva che era un cane stupido e fifone, pieno di difetti che lei amava elencare anche a interlocutori occasionali o a perfetti sconosciuti che incontrava per strada. Martino aveva paura, tra le altre cose, degli oggetti appuntiti, delle oche (un cane barbone che aveva paura della oche!) e di entrare nei furgoni dalla parte posteriore. In compenso appena poteva si buttava nell’acqua a nuotare e non si faceva scoraggiare dalla stagione avversa e dalla veemenza dei flutti, talché un giorno di marzo fu proprio la padrona a dover entrare nell’acqua gelata fino alla vita e trascinarlo fuori dal mare per il collare, dopo che il povero Martino era stato sul punto di soccombere. Lo coperse di contumelie, un po’ in italiano e un po’ in dialetto, mentre lui uggiolava sotto un massaggio vigoroso a colpi di plaid.
        """
        
        swiftyGPT.summary(text: text, language: .italian) { result in
            switch result {
            case .success(let response):
                XCTAssertLessThan(response.count, text.count)
            case .failure(let error):
                if let error = error as? SwiftyGPTError {
                    XCTFail(error.message)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testDefaultAsync() async throws {
        let text = """
            La mia istruttrice di nuoto Elke W. aveva un cane barbone bianco, piuttosto grande per la sua razza, di nome Martino. Lei stessa ammetteva che era un cane stupido e fifone, pieno di difetti che lei amava elencare anche a interlocutori occasionali o a perfetti sconosciuti che incontrava per strada. Martino aveva paura, tra le altre cose, degli oggetti appuntiti, delle oche (un cane barbone che aveva paura della oche!) e di entrare nei furgoni dalla parte posteriore. In compenso appena poteva si buttava nell’acqua a nuotare e non si faceva scoraggiare dalla stagione avversa e dalla veemenza dei flutti, talché un giorno di marzo fu proprio la padrona a dover entrare nell’acqua gelata fino alla vita e trascinarlo fuori dal mare per il collare, dopo che il povero Martino era stato sul punto di soccombere. Lo coperse di contumelie, un po’ in italiano e un po’ in dialetto, mentre lui uggiolava sotto un massaggio vigoroso a colpi di plaid.
        """
        
        let result: Result<String, Error> = await swiftyGPT.summary(text: text, language: .italian)
        switch result {
        case .success(let response):
            XCTAssertLessThan(response.count, text.count)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
