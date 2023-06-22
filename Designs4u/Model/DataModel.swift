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
    @Published var tokens = [Skill]()
    private var allSkills = [Skill]()
    
    var searchResults: [Person] {
        let setTokens = Set(tokens)
        
        
        return people.filter { person in
            guard person.skills.isSuperset(of: setTokens) else { return false }
            guard searchText.isEmpty == false else { return true }
            
            for string in [person.firstName, person.lastName, person.bio, person.details] {
                if string.localizedCaseInsensitiveContains(searchText) {
                    return true
                }
            }
            
            return false
        }
    }
    
    var suggestedTokens: Binding<[Skill]> {
        if searchText.starts(with: "#") {
            return .constant(allSkills)
        } else {
            return .constant([])
        }
    }
    
    func fetch() async throws {
        let url = URL(string: "https://hws.dev/designers.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        people = try JSONDecoder().decode([Person].self, from: data)
        allSkills = Set(people.map(\.skills).joined()).sorted()
    }
}
