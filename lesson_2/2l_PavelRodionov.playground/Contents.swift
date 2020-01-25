import UIKit
import Foundation

//task 1
print("--- task 1")

func isEven(n: Int) -> Bool {
    return n & 1 == 0
}

print(isEven(n: 3))
print(isEven(n: 6))


//task 2
print("--- task 2")

func isDivide3(n: Int) -> Bool {
    return n % 3 == 0
}

print(isDivide3(n: 5))
print(isDivide3(n: 9))


//task 3
print("--- task 3")

var mass100 = Array(1...100)
print(mass100)


//task 4
print("--- task 4")

for x in mass100 {
    if isEven(n: x) || !isDivide3(n: x) {
        mass100.remove(at: mass100.firstIndex(of: x)!)
    }
}

print(mass100)


//task 5
print("--- task 5")

func fib(n: UInt) -> UInt {
    var a: UInt = 0
    var b: UInt = 1
    var c: UInt = 0
    for _ in 0..<n {
        c = a + b
        a = b
        b = c
    }
    return a
}

var fibMass: [UInt] = []
for x in 0...90 {
    fibMass.append(fib(n: UInt(x)))
}

print(fibMass)


//task 6
print("--- task 6")

func eratosfen(n: Int) -> [Int] {
    var mass = Array(repeating: true, count: n)
    var simpleNums: [Int] = []
    
    mass[0] = false
    mass[1] = false
    
    for i in 2..<n where mass[i] {
        for j in stride(from: 2 * i, to: n, by: i) {
            mass[j] = false
        }
    }
    
    for (i, x) in mass.enumerated() where x {
        simpleNums.append(i)
    }
    return simpleNums
}

print(eratosfen(n: 100))
