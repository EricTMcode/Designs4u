//
//  DataModel.swift
//  Designs4u
//
//  Created by Eric on 22/06/2023.
//

import SwiftUI

@MainActor
class DataModel: ObservableObject {
    @Published var people = [Person]()
    
    @Published var searchText = ""
    
    var searchResults: [Person] {
        people.filter { person in
            guard searchText.isEmpty == false else { return true }
            
            for string in [person.firstName, person.lastName, person.bio, person.details] {
                if string.localizedCaseInsensitiveContains(searchText) {
                    return true
                }
            }
            
            return false
        }
    }
    
    func fetch() async throws {
        let url = URL(string: "https://hws.dev/designers.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        people = try JSONDecoder().decode([Person].self, from: data)
    }
}
