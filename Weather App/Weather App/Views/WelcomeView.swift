//
//  WelcomeView.swift
//  Weather App
//
//  Created by Eduardo Blanco Bielsa on 8/5/23.
//

import SwiftUI
//for LocationButton
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to myWeather app")
                    .bold().font(.title)
                Text("Please, share your current location to get the weather in your area").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .tint(.purple)
            .cornerRadius(40)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
