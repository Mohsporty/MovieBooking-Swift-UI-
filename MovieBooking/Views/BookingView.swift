//
//  BookingView.swift
//  MovieBooking
//
//  Created by Mohammad  on 02/05/2024.
//

import SwiftUI

struct BookingView: View {
    
    // this code for back button in the booking movie page
    
    @Environment(\.dismiss) var dismiss
    
    
    @State var gradient = [Color ("backgroundColor2" ).opacity(0),Color ("backgroundColor2" ),Color ("backgroundColor2" ),Color ("backgroundColor2" )]
    
    
    // varibale for date and time
    
    @State var selectedDate = false
    @State var selectedHour = false
    @State var bindingselection = false
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity,  alignment: .top)
                VStack{
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(spacing: 0.0){
                    HStack{
                        CircleButton(action: {
                            
                            dismiss()
                            
                        }, image: "arrow.left")
                        Spacer()
                        
                        CircleButton(action: {}, image: "ellipsis")
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 200)
                    
                    Text("in the multiverse of madness")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of... ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    
                    Text("select date and time ")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    
                    // this is date code to add in the booking time and showing how to add the button intgreed page
                    HStack(alignment: .top, spacing: 20.0){
                        DateButton(weekDay: "Thu",numDay: "21", isSelected: $bindingselection)
                            .padding(.top,90)
                        DateButton(weekDay: "Fri",numDay: "22", isSelected: $bindingselection)
                            .padding(.top,70)
                        DateButton(weekDay: "Sat",numDay: "23",width: 70, height: 100, isSelected: $selectedDate, action: { withAnimation(.spring()){
                                selectedDate.toggle()
                                    
                                }
                            
                        })
                        .padding(.top,30)
                        DateButton(weekDay: "Sun",numDay: "24", isSelected: $bindingselection)
                            .padding(.top,70)
                        DateButton(weekDay: "Mon",numDay: "25", isSelected: $bindingselection)
                            .padding(.top,90)
                        
                    }
                    // timeing code and intgreted with button page
                    
                    HStack(alignment: .top, spacing: 20.0){
                        TimeButton(hour: "16:00", isSelected: $bindingselection)
                            .padding(.top, 20)
                        TimeButton(hour: "17:00", isSelected: $bindingselection)
                        TimeButton(hour: "18:00", width: 70, height: 40, isSelected: $selectedHour, action: {withAnimation(.spring()){
                            selectedHour.toggle()
                        }
                        })
                        .padding(.top, -20)
                        TimeButton(hour: "19:00", isSelected: $bindingselection)
                        TimeButton(hour: "20:00", isSelected: $bindingselection)
                            .padding(.top, 20)
                    }
                    
                    NavigationLink{
                       SeatsView()
                    } label: {
                        
                        // resrvation code also intgreted with other code
                        LargeButton()
                            .padding(20)
                            .offset(y: selectedDate && selectedHour ? 0 : 200)
                        
                        
                    }
                
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .background(Color("backgroundColor2"))
        .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BookingView()
}
