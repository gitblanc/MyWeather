//
//  ContentView.swift
//  Weather App
//
//  Created by Eduardo Blanco Bielsa on 8/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {//adds an asyncronous task
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }else {
                if locationManager.isLoading {
                    LoadingView()
                }else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(.black)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
