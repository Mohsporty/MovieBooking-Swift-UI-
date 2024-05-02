//
//  HomeView.swift
//  MovieBooking
//
//  Created by Mohammad  on 01/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var animate =  false
    
  @State  var posters1: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]

   @State var posters2: [String] = ["poster7", "poster8", "poster9", "poster10", "poster11", "poster12"]

   @State var posters3: [String] = ["poster13", "poster14", "poster15", "poster16", "poster17", "poster18"]

    
    
    
    
    
    
    var body: some View {
        ZStack{ 
            
            //  this code for anamitions view in the page and given to color togather
            CircleBackground (color: Color ("greenCircle"))
                .blur(radius: animate ? 30: 100)
                .offset(x: animate  ? -50: -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()){
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: animate ? 30: 100 )
                .offset(x: animate ? 100 : 130, y: animate ? 150 :100)
            
            
            
            
            VStack(spacing: 0.0) {
                
                // this code to put the text and choose the font and size
                Text("Choose Movie")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                // this to add search bar in the page
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0){
                        ScrollSection(title: "Now Playing", posters: posters1)
                        ScrollSection(title: "Coming soon", posters: posters2)
                        ScrollSection(title: "Top Movies", posters: posters3)
                        ScrollSection(title: "Favorite", posters: posters1)
                    }
                    
                    // some space for custome bar 
                    .padding(.bottom, 90)
                }
                
                
                
            }
            // this code for background i put here
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    HomeView()
}
