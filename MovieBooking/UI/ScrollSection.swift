//
//  ScrollSection.swift
//  MovieBooking
//
//  Created by Mohammad  on 02/05/2024.
//

import SwiftUI

struct ScrollSection: View {
    
    @State var title = "Now Playing"
    
    @State var posters: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            
            
            // this code for put the photo with one varebli in up we type under name postres
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20.0) {
                    ForEach(posters.indices, id: \.self){ index in
                        Image(posters[index])
                            .resizable()
                            .frame(width: 100, height: 130)
                            .cornerRadius(20)
                        
                    }
                    
                }
                .offset(x: 20)
                .padding(.trailing, 40)
            }
        }
    }
}

#Preview {
    ScrollSection()
}
