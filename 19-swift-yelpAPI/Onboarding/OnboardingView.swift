//
//  OnboardingView.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 30/10/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var selectedViewIndex = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            if selectedViewIndex == 0 {
                Color.blue
            } else {
                Color.black
            }
            
            TabView(selection: $selectedViewIndex) {
                // screen 1
                OnboardingViewDetails(bgColor: Color.blue,
                                      headline: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city!") {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                .ignoresSafeArea()
                
                // screen 2
                OnboardingViewDetails(bgColor: Color.black,
                                      headline: "Discover your city",
                                      subHeadline: "We'll show you the best restaurants, venues, and more, based on your location.") {
                    dismiss()
                }
                .tag(1)
                .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                
                HStack(spacing: 16) {
                    Spacer()
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
