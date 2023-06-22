//
//  DesignerRow.swift
//  Designs4u
//
//  Created by Eric on 22/06/2023.
//

import SwiftUI

struct DesignerRow: View {
    var person: Person
    
    @ObservedObject var model: DataModel
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                HStack {
                    AsyncImage(url: person.thumbnail, scale: 3)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading) {
                        Text(person.displayName)
                            .font(.headline)
                        
                        Text(person.bio)
                            .multilineTextAlignment(.leading)
                            .font(.caption)
                    }
                }
            }
            .tint(.primary)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "info.circle")
            }
            .buttonStyle(.borderless)
        }
    }
}

struct DesignerRow_Previews: PreviewProvider {
    static var previews: some View {
        DesignerRow(person: .example, model: DataModel())
    }
}