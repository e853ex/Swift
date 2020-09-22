import Foundation

//Задание 1

let a = 6.0
let b = 8.0
let c = 128.0
let x = 4.0
let sum = 0

let answer = (Int)((a * pow(x, 2)) + (b * x) - c)

print("\(answer) = \(sum)")


//Задание 2

let q = 4.0
let w = 5.0
let r = 4.0

let q1 = pow(q, 2)
let w1 = pow(w, 2)
let hypotenuse = q1 + w1

print("Гипотенуза равна: \(hypotenuse)")

let perimetr = q + w + r

print("Периметр равен: \(perimetr)")


let area = 0.5 * q + w

print("Площадь равна: \(area)")


//Задание 3

let summ: Float = 1000.0
var percent: Float = 6.0
percent = (percent / 100)

var year1: Float = summ + (summ * percent)
var year2: Float = year1 + (year1 * percent)
var year3: Float = year2 + (year2 * percent)
var year4: Float = year3 + (year3 * percent)
var year5: Float = year4 + (year4 * percent)

print("""
    
    Доход за 5 лет под 6% годовых
    
    Первый год:     \(year1)
    Второй год:     \(year2)
    Третий год:     \(year3)
    Четвертый год:  \(year4)
    Пятый год:      \(year5)
""")

