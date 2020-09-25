import Foundation

//Задание 1  - Переделал
let equation = "(ax^2)-8x+15=0"
let a = 1.0
let b = -8.0
let c = 15.0

let dis: Double = sqrt((b*b)-4*a*c)

if dis == 0 {
    let radical: Double = (b-1) / 2*a
    print("У уравнения \(equation) один корень и он равен \(radical)")
} else if dis < 0 {
    print("У уравнения \(equation) корней нет")
} else {
    let rad1: Double = (b-1) - dis / (2*a)
    let rad2: Double = (b-1) + dis / (2*a)
    print("Уравнение \(equation) имеет два корня \(rad1) и \(rad2)")
}

//Задание 2

let q = 4.0
let w = 5.0
let r = 4.0

let q1 = pow(q, 2)
let w1 = pow(w, 2)
var hypotenuse:Double = sqrt(q1 + w1) // Исправил

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

