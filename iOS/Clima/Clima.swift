//
//  Clima.swift
//  Clima
//
//  Created by Caio on 31/12/22.
//

import Foundation

struct Response: Codable {
    
    var coord: Coord
    var weather: [Weather]?
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var rain: Rain?
    var clouds: Clouds?
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int

}

struct Coord: Codable {
    var lon: Double
    var lat: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct Wind: Codable {
    var speed: Double
    var deg: Int
}

struct Rain: Codable{
    var umh: Int
}

struct Clouds: Codable {
    var all: Int
}

struct Sys: Codable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
    
}


/* {"coord":{"lon":-35.7353,"lat":-9.6658},
 "weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"base":"stations",
 
 "main":{"temp":298.84,"feels_like":299.76,"temp_min":298.84,"temp_max":298.84,"pressure":1012,"humidity":88},
 "visibility":10000,
 
 "wind":{"speed":5.14,"deg":90},
 "rain":{"1h":.16},
 "clouds":{"all":75},
 "dt":1672598480,
 "sys":{"type":1,"id":8413,"country":"BR","sunrise":1672560356,"sunset":1672605989},
 "timezone":-10800,
 "id":3395981,
 "name":"Maceió",
 "cod":200} */
