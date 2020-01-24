import UIKit
import Foundation

// task 1
//ax^2 + bx + c = 0
print("task 1")

//data block
let a = 4.0//9.0
let b = 5.0//6.0
let c = 1.0
//

print("\(a)x^2 + \(b)x + \(c) = 0")

let d = b*b - 4*a*c //discriminant b^2 - 4ac
switch d {
    case _ where d > 0:
        print("x1 = \((-b + d.squareRoot())/(2*a))" )// -b + sqrt(d) / 2a
        print("x2 = \((-b - d.squareRoot())/(2*a))" )// -b - sqrt(d) / 2a
    case _ where d == 0:
        print( "x = \(-b/(2*a))" )// -b / 2a
    case _ where d < 0:
        print("don't resolved")
    default:
        print("some error")
}

//task 2
print("---------")
print("task 2")
print("triangle")

//data block
let katet1 = 3.0
let katet2 = 4.0
//

let gipotenuse = (katet1 * katet1 + katet2 * katet2).squareRoot()

print("katet1 = \(katet1)")
print("katet2 = \(katet2)")
print("gipotenuse = \(gipotenuse)")
print("S = \((katet1 * katet2) / 2)")
print("P = \(katet1 + katet2 + gipotenuse)")


//task 3
print("---------")
print("task 3")
print("bank deposit")

//data block
let deposit = 100.0
let persent = 20.0
//

let p = 1 + persent / 100

print("sum of deposit = \(deposit)")
print("persent of deposit = \(persent)")

//variant 1
print("--- variant 1")
let total = ["one year = \(p*deposit)",
            "two year = \(p*p*deposit)",
            "three year = \(p*p*p*deposit)",
            "four year = \(p*p*p*p*deposit)",
            "five year = \(p*p*p*p*p*deposit)"]
print(total)

//variant 2
print("--- variant 2")
for i in 1...5 {
    print("year \(i) = \(pow(p, Double(i)) * deposit)")
}








