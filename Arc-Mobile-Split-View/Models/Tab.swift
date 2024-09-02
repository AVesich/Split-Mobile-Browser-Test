//
//  Tab.swift
//  Arc-Mobile-Split-View
//
//  Created by Austin Vesich on 9/1/24.
//

import UniformTypeIdentifiers
import CoreTransferable

//struct Tab: Transferable {
//    static var transferRepresentation: some TransferRepresentation {
//        DataRepresentation(contentType: .tab) { tab in
//            tab.urlString.data(using: .utf8)!
//        } importing: { data in
//            let urlString = String(data: data, encoding: .utf8) ?? DEFAULT_URL_STRING
//            return Tab(urlString: urlString)
//        }
//    }
//    
//    static let TYPE_IDENTIFIER = "com.AVesich.Arc-Mobile-Split-View.tab"
//    public let urlString: String
//    
//    static let defaultTab = Tab(urlString: "https://www.google.com")
//}
//
//extension UTType {
//    static var tab: UTType { UTType(exportedAs: Tab.TYPE_IDENTIFIER) }
//}
