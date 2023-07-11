//
//  QueryTag.swift
//  happy-play
//
//  Created by Roy Cuenca on 11/07/2023.
//

import SwiftUI

struct QueryTag: View {
    
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue.capitalized)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .cyan : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.animals, isSelected: true)
    }
}
