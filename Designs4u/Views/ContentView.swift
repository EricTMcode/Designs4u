//
//  ContentView.swift
//  Designs4u
//
//  Created by Eric on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = DataModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(model.people) { person in
                        DesignerRow(person: person, model: model)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Design4u")
        }
        .task {
            do {
                try await model.fetch()
            } catch {
                print("Error handling is great!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}