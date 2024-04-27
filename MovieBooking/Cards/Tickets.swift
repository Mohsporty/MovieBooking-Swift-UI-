//
//  Tickets.swift
//  MovieBooking
//
//  Created by Mohammad  on 27/04/2024.
//

import SwiftUI

struct Tickets: View {
 @State   var tickets: [TicketModel] = [
        TicketModel(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        TicketModel(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        TicketModel(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]

    
    
    
    var body: some View {
        ZStack{
            ForEach(tickets) { ticket in
                InfinitesStackView(tickets: $tickets, ticket: ticket)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center )
    }
}

#Preview {
    Tickets()
}
// this data to build the ticket in the page also i add the first ticket by id for here
struct InfinitesStackView : View{
    @Binding var tickets : [TicketModel]
    var ticket : TicketModel
    
    
    @GestureState var isDragging: Bool = false
    @State var offset : CGFloat = .zero
    @State var height: CGFloat = 0
    
    var body: some View {
        VStack {
            Ticket(title: ticket.title, subtitle: ticket.subtitle, top: ticket.top, bottom: ticket.bottom, height: $height)
        }
        
        // this code for mange the ticket and slid rotations in the tickety
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity )
        .zIndex(getIndex() == 0 && offset > 100 ? Double(CGFloat(tickets.count) - getIndex()) - 1 : Double(CGFloat(tickets.count) - getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .rotationEffect(getIndex() == 1 ? .degrees(-6) : .degrees(0))
        .rotationEffect(getIndex() == 2 ? .degrees(6) : .degrees(0))
        .scaleEffect(getIndex() == 0 ? 1 : 0.9)
        .offset(x: getIndex() == 1 ? -40 : 0)
        .offset(x: getIndex() == 2 ? 40 : 0)
        .offset(x: offset)
        .gesture(
            DragGesture()
                .updating($isDragging, body:{ _, out, _ in
                    out = true
                }  )
            
            // this code for change the ticket wan i swip that
                .onChanged({value in
                    var translation = value.translation.width
            translation = tickets.first?.id == ticket.id ? translation : 0
            translation = isDragging ? translation : 0
                    withAnimation(.easeInOut(duration: 0.3 )) {
                offset = translation
            }
                          })
                .onEnded({ value in
                    let width = UIScreen.main.bounds.width
                    let swipedRight = offset > (width / 2)
                    let swipedLeft = -offset > (width / 2)
                    
                    
                    withAnimation(.easeInOut(duration: 0.5)) {
       // for left swip
                        if swipedLeft {
                            offset = -width
                            removeTickets()
                            
                        } else {
                            if swipedRight {
                                offset = width
                                removeAndadd()
                            } else {
                                offset = .zero
                            }
                        }
      
                    }
                    
                })
        )
    }
    func getIndex() -> CGFloat {
        let index = tickets.firstIndex { ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        
        return CGFloat(index)
    }
    
    func getRotation(angle: Double) -> Double {
        let width = UIScreen.main.bounds.width
        let progress = offset / width
        
        return Double(progress * angle)
    }
    // this fun for remove the ticket from front to get back of the ticket
    
    func removeAndadd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            var updateTicket = ticket
            updateTicket.id = UUID().uuidString
            
            tickets.append(updateTicket)
            withAnimation(.spring()){
                tickets.removeFirst()
            }
        }
    }
    // functions for swiped left and working the code on top
    func removeTickets (){
        withAnimation(.spring()){
            tickets.removeFirst()
        }
    }
    
}
