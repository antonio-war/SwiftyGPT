//
//  SwiftyGPTLanguage.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import Foundation
import NaturalLanguage

public enum SwiftyGPTLanguage: String {
    case afrikaans
    case arabic
    case armenian
    case azerbaijani
    case belarusian
    case bosnian
    case bulgarian
    case catalan
    case chinese
    case croatian
    case czech
    case danish
    case dutch
    case english
    case estonian
    case finnish
    case french
    case galician
    case german
    case greek
    case hebrew
    case hindi
    case hungarian
    case icelandic
    case indonesian
    case italian
    case japanese
    case kannada
    case kazakh
    case korean
    case latvian
    case spanish
    case swahili
    case swedish
    case tagalog
    case tamil
    case thai
    case turkish
    case ukrainian
    case urdu
    case vietnamese
    case welsh
    
    var naturalLanguage: NLLanguage? {
        switch self {
        case .afrikaans:
            return nil
        case .arabic:
            return .arabic
        case .armenian:
            return .armenian
        case .azerbaijani:
            return nil
        case .belarusian:
            return nil
        case .bosnian:
            return nil
        case .bulgarian:
            return .bulgarian
        case .catalan:
            return .catalan
        case .chinese:
            return .simplifiedChinese
        case .croatian:
            return .croatian
        case .czech:
            return .czech
        case .danish:
            return .danish
        case .dutch:
            return .dutch
        case .english:
            return .english
        case .estonian:
            return nil
        case .finnish:
            return .finnish
        case .french:
            return .french
        case .galician:
            return nil
        case .german:
            return .german
        case .greek:
            return .greek
        case .hebrew:
            return .hebrew
        case .hindi:
            return .hindi
        case .hungarian:
            return .hungarian
        case .icelandic:
            return .icelandic
        case .indonesian:
            return .indonesian
        case .italian:
            return .italian
        case .japanese:
            return .japanese
        case .kannada:
            return .kannada
        case .kazakh:
            if #available(iOS 16.0, *) {
                return .kazakh
            } else {
                return nil
            }
        case .korean:
            return .korean
        case .latvian:
            return nil
        case .spanish:
            return .spanish
        case .swahili:
            return nil
        case .swedish:
            return .swedish
        case .tagalog:
            return nil
        case .tamil:
            return .tamil
        case .thai:
            return .thai
        case .turkish:
            return .turkish
        case .ukrainian:
            return .ukrainian
        case .urdu:
            return .urdu
        case .vietnamese:
            return .vietnamese
        case .welsh:
            return nil
        }
    }
}
