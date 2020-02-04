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

enum EngineState: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

protocol Car {
    var color: String {get set}
    var bodyType: BodyType {get set}
    var transmission: Transmission {get set}
    var price: Int {get set}
    var km: Int {get set}

    var doorState: DoorState {get set}
    var windowState: WindowState {get set}
    var engineState: EngineState {get set}
}

extension Car {
    func doorInfo() {
        print(doorState.rawValue)
    }
    func windowInfo() {
        print(windowState.rawValue)
    }
    func engineInfo() {
        print(engineState.rawValue)
    }
}

extension SportCar: Car {
    func makeDoor(action: DoorState) {
        self.doorState = action
    }
    func makeWindow(action: WindowState) {
        self.windowState = action
    }
    func makeEngine(action: EngineState) {
        self.engineState = action
    }
}


extension SportCar: CustomStringConvertible {
    var description: String {
        return "Sport Car"
    }
}

extension TruncCar: CustomStringConvertible {
    var description: String {
        return "Trunc Car"
    }
}

class SportCar {
    var color: String
    var bodyType: BodyType
    var transmission: Transmission
    var price: Int
    var km: Int
    
    var doorState: DoorState
    var windowState: WindowState
    var engineState: EngineState
    
    
    init(color: String, bodyType: BodyType, transmission: Transmission, price: Int, km: Int, doorState: DoorState = .open, windowState: WindowState = .close, engineState: EngineState = .on) {
        self.color = color
        self.bodyType = bodyType
        self.transmission = transmission
        self.price = price
        self.km = km
        self.doorState = doorState
        self.windowState = windowState
        self.engineState = engineState
    }
    

    convenience init(color: String) {
        self.init(color: color, bodyType: .roadster, transmission: .manual, price: 3_000_000, km: 0)
    }
}

class TruncCar: Car {
    var color: String
    var bodyType: BodyType
    var transmission: Transmission
    var price: Int
    var km: Int
    
    var doorState: DoorState
    var windowState: WindowState
    var engineState: EngineState
    
    
    init(color: String = "Yellow", bodyType: BodyType = .hetchback, transmission: Transmission = .manual, price: Int, km: Int, doorState: DoorState = .open, windowState: WindowState = .close, engineState: EngineState = .on) {
        self.color = color
        self.bodyType = bodyType
        self.transmission = transmission
        self.price = price
        self.km = km
        self.doorState = doorState
        self.windowState = windowState
        self.engineState = engineState
    }
}

let sportCar = SportCar(color: "Red")
print(sportCar.description)
sportCar.makeDoor(action: .open)
sportCar.doorInfo()

let truncCar = TruncCar(price: 300_000, km: 10_000)
print(truncCar.description)
truncCar.windowInfo()


