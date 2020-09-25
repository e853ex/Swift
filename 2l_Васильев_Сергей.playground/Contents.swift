import Foundation

//Задание 1

func evenOdd (value: Int) {
    if value % 2 == 0 {
    print ("Это четное число ")
} else {
    return print ("Это нечетное число")
}
}

print("Задание 1")
let a = 10
evenOdd(value: a)
evenOdd(value: 9)
print(" ")

//Задание 2

func divisionByThree(value: Int) {
    let value1 = value%3
    value1 == 0 ? print("Ваше число \(value) делится на 3") : print("Ваше число \(value) не делится на 3")
}

print("Задание 2")
divisionByThree(value: 9)
divisionByThree(value: 4)
print(" ")

//Задание 3

var array = [Int]()
var i = 0

while i < 100 {
    array.append(i+1)
    i += 1
}

print("Задание 3")
print (array)
print(" ")

//Задание 4

var array2 = array

for element in array2 where (element % 2 == 0) || (element % 3 != 0) {
    array2.remove(at : (array2.firstIndex(of: element)!))
}

print("Задание 4")
print(array2)
print(" ")

//Задание 5

func fibonacci (_ n: Int) -> (Decimal) {
    if (n < 3) {
        return 1
    } else {
        var z1 : Decimal = 1, z2 : Decimal = 1, z:Decimal
        for _ in 3...n {
            z = z1+z2
            z1 = z2
            z2 = z
        }
        return z2
    }
}

var fibArray = [Decimal]()
fibArray.append(0)
var n  = 50
for i in 1...n {
    fibArray.append(fibonacci(i))
}

print("Задание 5")
print(fibArray)
print(" ")

//Задание 6

func Prime (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func PrimeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Prime(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}

print("Задание 6")
print (PrimeArray())



