import UIKit

//Домашнее задание №3

//Цветовая палитра
extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}

//Опции авто
extension ChooseOptions {
    var value: String? {
        switch self {
        case ChooseOptions.full: return "Обогрев зеркал, Обогрев лобового стекла, Парктроники, Аудиосистема, АБС, Турбина, Коврики"
        case ChooseOptions.medium: return "Обогрев зеркал, АБС, Аудиосистема, Коврики"
        case ChooseOptions.low: return "АВС, Коврики"
        }
    }
}

//Марка авто
enum Brand {
    case    Honda, Hyundai, BMW, Acura, Ferrari, Ford, Fiat, GMC, Audi, Dodge,
            IVECO, Lamborghini, Mazda, Mersedes, Nissan, Opel, Scania, Toyota, Volvo
}

//Трансмиссия
enum Transmission {
    case manual, auto
}

//Наличие магнитолы с возможностью чтения формата мр3
enum Mp3 {
    case yes, no
}

//Двигатель
enum Engine {
    case start, stop
}

//Опции
enum ChooseOptions {
    case full
    case medium
    case low
}

//Двери
enum DoorState {
    case open, close
}

//Прицеп
enum Trailer {
    case yes, no
}

//Функция для пользователя : инфо о машине
func printCarProperties(car: Car) {
    print("###########################################")
    print("Марка машины: \(car.brand)")
    print("Год выпуска авто: \(car.year)")
    print("Цвет: \(car.color.name ?? "неизвестно")")
    print("Обьем багажника / кузова: \(car.trunkSize)")
    print("Запущен ли двигатель: \(car.engine == .start ? "Да" : "Нет")")
    print("Поддержка мр3: \(car.mp3 == .yes ? "Да" : "Нет")")
    print("Трансмиссия: \(car.transmission == .auto ? "Автомат" : "Механика")")
    print("Пробег: \(car.km)")
    print("Максимальная скорость: \(car.maxSpeed)")
    print("Комплектация: \(car.options.value ?? "неизвестно")")
    print("Радиус колес: \(car.wheelRadius)")
    print("Двери: \(car.doorState == .open ? "Открыты" : "Закрыты")")
}

//Легковой автомобиль
struct Car {
    let maxTruckSizi = 1000.0
    let brand: Brand
    let year: Int
    let color: UIColor
    var trunkSize: Double {
        didSet {
            if trunkSize <= maxTruckSizi {
            print("Вы заполнили багажник авто на \(trunkSize) от допустимого обьема \(maxTruckSizi)")
        } else {
        print("Вы привысили норму допустимого обьема багажника в \(maxTruckSizi)")
        }
        }
    }
    var engine: Engine
    let mp3: Mp3
    let transmission: Transmission
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Автомобиль проехал новый участок с растоянием \(distance) км")
        }
    }
    let maxSpeed: Int
    var options: ChooseOptions
    var wheelRadius: Int
    var doorState: DoorState
    
    //Что бы не размножать код пишу тока в 1 классе, аналогично создается во всех
    mutating func openDoor() {
        doorState = .open
    }
    
    mutating func closeDoor() {
          doorState = .close
      }
    
    mutating func engineStart() {
        engine = .start
    }
    
    mutating func engineStop() {
          engine = .stop
      }
    
    func printDistance () {
        print ("Автомобиль проехал \(km) км")
    }
    
    //Возможность поменять комплектацию авто
    mutating func optionsNewFull() {
            options = .full
        }
    
    mutating func optionsNewMedium() {
            options = .medium
        }
    
    mutating func optionsNewLow() {
            options = .low
        }
}

//Спорт кар. Отличие от легкового разгон до 100км
struct SportCar {
    let brand: Brand
    let year: Int
    let color: UIColor
    let trunkSize: Double
    var engine: Engine
    let mp3: Mp3
    let transmission: Transmission
    var km: Double
    var maxSpeed: Int
    var options: ChooseOptions
    var wheelRadius: Int
    var doorState: DoorState
    let accelerationTo100Km: Double
}

//Грузовой автомобиль. Отличие от других авто наличие прицепа и отсутствия выбора комплектации
struct TrunkCar {
    let brand: Brand
    let year: Int
    let color: UIColor
    let trunkSize: Double
    let trailer: Trailer
    var engine: Engine
    let mp3: Mp3
    let transmission: Transmission
    var km: Double
    let maxSpeed: Int
    var wheelRadius: Int
    var doorState: DoorState
}

var car1 = Car(brand: .BMW, year: 2020, color: .blue,
               trunkSize: 500, engine: .stop, mp3: .yes,
               transmission: .auto, km: 0, maxSpeed: 200,
               options: .full, wheelRadius: 15, doorState: .close)

printCarProperties(car: car1)

let car2 = SportCar(brand: .Ferrari, year: 2020, color: .red,
                    trunkSize: 100, engine: .start, mp3: .yes,
                    transmission: .auto, km: 0, maxSpeed: 400,
                    options: .full, wheelRadius: 22, doorState: .close,
                    accelerationTo100Km: 0.7)

let car3 = TrunkCar(brand: .IVECO, year: 1989, color: .clear,
                    trunkSize: 50000, trailer: .yes, engine: .start,
                    mp3: .no, transmission: .manual, km: 0, maxSpeed: 100,
                    wheelRadius: 30, doorState: .close)

car3.engine

car1.trunkSize = 300

car1.options
car1.optionsNewLow()
car1.options
