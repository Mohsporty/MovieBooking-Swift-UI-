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
    @State var bottom = "thor-bottom"
    
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
            
            .cornerRadius(40, corners: [.topLeft, .topRight])
            
            
            // this code for line under the ticket photo
            VStack(spacing: 10.0) {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                    .frame(width: 200, height: 1)
                    .opacity(0.6)
                
                HStack(spacing: 20.0){
                    HStack(spacing: 4.0){
                        Text("Date:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("April 24")
                            .foregroundColor(.black)
                        
                    }
                    HStack(spacing: 4.0){
                        Text("Time:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("6 PM")
                            .foregroundColor(.black)
                        
                    }
                }
                HStack(spacing: 20.0){
                    HStack(spacing: 4.0){
                        Text("Row:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("2")
                            .foregroundColor(.black)
                        
                    }
                    HStack(spacing: 4.0){
                        Text("Seats")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("9, 10")
                            .foregroundColor(.black)
                        
                    }
                }
                
                
                // bacode photo is here code also the fream is under for shadwo
                
                Image("code")
            }
            .frame(width: 250, height: 135, alignment: .top)
            .background(.ultraThinMaterial)
            .background(Image(bottom)
                .resizable()
                .aspectRatio(contentMode: .fill)
            )
            .mask(
                Image(bottom)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            
            
        }
        .frame(height: 460)
        .font(.footnote)
        .shadow(radius: 10)
        
    }
}

#Preview {
    Ticket()
}
