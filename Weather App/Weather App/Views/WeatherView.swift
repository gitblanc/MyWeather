//
//  WeatherView.swift
//  Weather App
//
//  Created by Eduardo Blanco Bielsa on 9/5/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var res: String {
            switch weather.weather.first?.main {
            case "thunderstorm":
                return "cloud.bolt.rain"
            case "drizzle":
                return "cloud.drizzle"
            case "rain":
                return "cloud.heavyrain"
            case "snow":
                return "snowflake"
            case "clear":
                return "sun.max"
            default:
                return "cloud"
            }
        }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("  \(weather.name)")
                        .bold().font(.title)
                    Text("   Today, \(Date().formatted(.dateTime.month().day().year().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20){
                            Image(systemName: res)
                                .font(.system(size: 50))
                            Text("  \(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "º")
                            .font(.system(size: 100))
                            .padding()
                    }
                    
                    AsyncImage(url: URL(string: "https://img10.reactor.cc/pics/post/full/Evangelion-Anime-art-Anime-5356902.jpeg")){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 390)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("  Weather now:")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: weather.main.tempMin.roundDouble() + "º")
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max temp    ", value: weather.main.tempMax.roundDouble() + "º")
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity     ", value: weather.main.humidity.roundDouble() + "% ")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(0, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(.black)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
