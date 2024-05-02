//
//  CustomSearchBar.swift
//  MovieBooking
//
//  Created by Mohammad  on 02/05/2024.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @State var serchText = ""
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $serchText)
            
            Image(systemName: "mic.fill")
        }
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .font(.headline)
        .background(.ultraThinMaterial)
        .foregroundColor(.white.opacity(0.6))
        .cornerRadius(10)
    }
}

#Preview {
    CustomSearchBar()
}
