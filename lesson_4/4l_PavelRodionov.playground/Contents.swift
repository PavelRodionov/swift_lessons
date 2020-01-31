import UIKit
import Foundation


enum BodyType {
    case sedan
    case hetchback
    case crossover
    case roadster
}

enum Transmission {
    case manual
    case auto
}

enum WindowState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum DoorState: String {
    case open = "Двери открыты"
    case lock = "Двери заблокированы"
}

class Car {
    static var count = 0
    
    var name = "Abstract car"
    let color: String
    let bodyType: BodyType
    let transmission: Transmission
    let price: Int
    var km: Int
    
    var doorState: DoorState
    var windowState: WindowState
    
    init(color: String, bodyType: BodyType, transmission: Transmission, price: Int, km: Int, doorState: DoorState = .lock, windowState: WindowState = .close) {
        Car.count += 1
        self.color = color
        self.bodyType = bodyType
        self.transmission = transmission
        self.price = price
        self.km = km
        self.doorState = doorState
        self.windowState = windowState
    }
    
    final func makeDoor(action: DoorState) {
        self.doorState = action
        print(action.rawValue)
    }
    
    final func makeWindow(action: WindowState) {
        self.windowState = action
        print(action.rawValue)
    }
    
    func carInfo() -> String {
        return name
    }
    
    final func setName(name: String) {
        self.name = name
    }
    
    static func carCount() -> String {
        return "You have \(count) cars"
    }
}

class Toyota: Car {
    
    override func carInfo() -> String {
        return "------\n\(name)\ncolor: \(color)\nbody: \(bodyType)\ntransmission: \(transmission)\nprice: \(price)\nkm: \(km)"
    }
}

final class ToyotaSport: Toyota {
    
    init(color: String, bodyType: BodyType, transmission: Transmission, price: Int, km: Int) {
        super.init(color: color, bodyType: bodyType, transmission: transmission, price: price, km: km)
    }
    
    convenience init(color: String) {
        self.init(color: color, bodyType: .roadster, transmission: .manual, price: 3_000_000, km: 0)
    }
}

final class ToyotaTrunk: Toyota {
   
}

let toyotaCamry = Toyota(color: "grey", bodyType: .sedan, transmission: .auto, price: 900_000, km: 10_000)
toyotaCamry.setName(name: "Toyota New Camry")
print(toyotaCamry.carInfo())

let toyotaCorola = Toyota(color: "white", bodyType: .hetchback, transmission: .manual, price: 800_000, km: 6_000, windowState: .close)
toyotaCorola.setName(name: "Toyota Corola")
print(toyotaCorola.carInfo())
toyotaCorola.makeDoor(action: .open)

let toyotaSport = ToyotaSport(color: "red")
toyotaSport.setName(name: "Toyota Sport")
print(toyotaSport.carInfo())

let trunc = ToyotaTrunk(color: "brown", bodyType: .crossover, transmission: .auto, price: 400_000, km: 60_000)
trunc.setName(name: "Strange car")
print(trunc.carInfo())

print(Car.carCount())
