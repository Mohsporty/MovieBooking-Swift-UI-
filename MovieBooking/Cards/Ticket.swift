//
//  Ticket.swift
//  MovieBooking
//
//  Created by Mohammad  on 25/04/2024.
//

import SwiftUI

struct Ticket: View {
    
    @State var title = "Thor"
    @State var subtitle = "Love and Thunder"
    @State var top = "thor-top"
    
    var gradient = [ Color("cyan"), Color("cyan").opacity(0), Color("cyan").opacity(0)]
    var body: some View {
        VStack(spacing: 0.0) {
            
            // this code is add the name of the moveies
            VStack(spacing: 4.0) {
                Text(title)
                    .fontWeight(.bold)
                
                Text(subtitle)
                
                // this is all fream informations in the app
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 250, height: 325, alignment: .top)
            .foregroundColor(.white)
            
            
            // this code for image call from the app
            .background(
            Image(top)
                .resizable()
                .aspectRatio(contentMode: .fill)
            )
            
            .mask(
                Image("thor-top")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
            }
            
            .cornerRadius(40 )
        }
        .frame(height: 460)
        .font(.footnote)
        .shadow(radius: 10)
        
    }
}

#Preview {
    Ticket()
}
