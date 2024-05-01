//
//  Viewticket.swift
//  MovieBooking
//
//  Created by Mohammad  on 24/04/2024.
//
import SwiftUI

struct TicketViwe: View {
  @State var animate = false
    
    
    var body: some View {
            ZStack {
                
                // this code to mearrge to color to gather also make like anations
                CircleBackground (color: Color ("greenCircle"))
                    .blur(radius: animate ? 30: 100)
                    .offset(x: animate  ? -50: -130, y: animate ? -30 : -100)
                
                
                // this code to to make the ball i bulid be like anamie and moving in the app 
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()){
                            animate.toggle()
                        }
                    }
                
                CircleBackground(color: Color("pinkCircle"))
                    .blur(radius: animate ? 30: 100 )
                    .offset(x: animate ? 100 : 130, y: animate ? 150 :100)
                
                
                // this is to add informatintion in first page  and putt all informations choess the font and color
                
                VStack(spacing: 30.0) {
                    Text("Mobile Ticket ")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("Once you Buy a Movie Ticket Simply scan the barcode to acces to your movie  ")
                        .frame(maxWidth: 248)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                
                // concet page of tickets and all informations about connect the page
                
                Tickets()
                    .padding(.top, 30)
                
                
                
                // this is to code to type the background
                
            }   .background(
                LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom))
        }
    }
    
    #Preview {
        TicketViwe()
    }

