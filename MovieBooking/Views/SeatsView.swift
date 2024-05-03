//
//  SeatsView.swift
//  MovieBooking
//
//  Created by Mohammad  on 03/05/2024.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0.0){
            HStack{
                CircleButton(action: {
                    dismiss()
                }, image: "arrow.left")
                
                Spacer()
                
                
                Text("Choose Seats")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                
                Spacer()
                
                CircleButton(action: {}, image: "Calendar")
            }
            
            // this code for view stage also the glow is customizw from utils page there
            .padding(.top, 46)
            .padding(.horizontal, 20)
            
            Image("frontSeat")
                .padding(.top, 55)
                .glow(color: Color("pink"), radius: 20)
            
            
            
            Image("seats")
                .frame(height: 240)
                .padding(.top, 60)
                .padding(.horizontal, 20)
            
            
            // this for avalibillty code and informatiomn on it
            
            HStack(spacing: 20.0){
                StatusUI()
                StatusUI(color: Color("majenta"), text: "Reserved")
                StatusUI(color: Color("cyan"), text: "Selected")
            }
            .padding(.top, 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeatsView()
}
