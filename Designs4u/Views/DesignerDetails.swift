//
//  DesignerDetails.swift
//  Designs4u
//
//  Created by Eric on 22/06/2023.
//

import SwiftUI

struct DesignerDetails: View {
    var person: Person
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: person.photo, scale: 3)
                    .overlay(
                    Rectangle()
                        .strokeBorder(.primary.opacity(0.2), lineWidth: 4)
                    )
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(person.displayName)
                        .font(.largeTitle.bold())
                    
                    Text(person.bio)
                    Text(person.details)
                }
                .padding()
            }
            .padding(.vertical)
        }
    }
}

struct DesignerDetails_Previews: PreviewProvider {
    static var previews: some View {
        DesignerDetails(person: .example)
    }
}
