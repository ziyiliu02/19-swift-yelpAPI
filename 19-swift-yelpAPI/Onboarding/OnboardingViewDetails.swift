//
//  OnboardingViewDetails.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 30/10/23.
//

import SwiftUI

struct OnboardingViewDetails: View {
    
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(bgColor)
            
            VStack(spacing: 0) {
                Spacer()
                Spacer()
                
                Image("onboarding")
                
                Text(headline)
                    .font(Font.system(size: 22))
                    .bold()
                    .padding(.top, 32)
                
                Text(subHeadline)
                    .padding(.horizontal)
                    .padding(.top, 4)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                        
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)

            }
            .foregroundStyle(.white)
        }
    }
}

struct OnboardingViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewDetails(bgColor: Color.gray,
                              headline: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city!") {
            //
        }
    }
}
