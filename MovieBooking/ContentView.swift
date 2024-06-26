//
//  ContentView.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                TabView(selection: $currentTab)
                          {
         // this jome view to concet the page of home view to showing in the firs page of that
                    HomeView()
                                  .tag(Tab.home)
                    Text("Location")
                                  .tag(Tab.location)
                              TicketViwe()
                                  .tag(Tab.ticket)
                              Text("Category")
                                  .tag(Tab.category)
                              Text("Profile")
                                  .tag(Tab.profile)
                    
                    
                }
               CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
