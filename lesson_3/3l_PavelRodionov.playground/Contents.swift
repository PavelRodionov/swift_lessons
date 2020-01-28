import UIKit
import Foundation

enum EngineState {
    case start
    case stop
}

enum WindowState {
    case open
    case close
}

struct Car {
    var carModel: String
    var year: Int
    var size: Int
    var windows: WindowState
    var engineState: EngineState

    mutating func windowEvent(state: WindowState) {
        self.windows = state
    }
}

struct Truck {
    var carModel: String
    var year: Int
    var size: Int
    var windows: WindowState
    var engineState: EngineState
}

var lada = Car(carModel: "lada Kalina", year: 2017, size: 200, windows: .close, engineState: .stop)

print(lada.windows)
lada.windowEvent(state: .open)
print(lada.windows)
