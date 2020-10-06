import UIKit

//Домашнее задание №4

//Цветовая палитра
extension UIColor {
    var name: String? {
        switch self {
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

protocol CarProtocol {
    var maxTruckSizi: Double { get }
    var brand: Brand { get }
    var year: Int { get }
    var color: UIColor { get }
    var trunkSize: Double { get set }
    var engine: Engine { get set }
    var mp3: Mp3 { get set }
    var transmission: Transmission { get }
    var km: Double { get set }
    var maxSpeed: Int { get }
    var options: ChooseOptions { get set }
    var wheelRadius: Int { get set }
    var doorState: DoorState { get set }
    
}

extension CarProtocol {
    
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
    
    mutating func optionsNewFull() {
            options = .full
        }
    
    mutating func optionsNewMedium() {
            options = .medium
        }
    
    mutating func optionsNewLow() {
            options = .low
        }
    
    func printCarProperties() {
        print("###########################################")
        print("Марка машины: \(self.brand)")
        print("Год выпуска авто: \(self.year)")
        print("Цвет: \(self.color.name ?? "неизвестно")")
        print("Обьем багажника / кузова: \(self.trunkSize)")
        print("Запущен ли двигатель: \(self.engine.rawValue)")
        print("Поддержка мр3: \(self.mp3 == .yes ? "Да" : "Нет")")
        print("Пробег: \(self.km)")
        print("Максимальная скорость: \(self.maxSpeed)")
        print("Комплектация: \(self.options.rawValue)")
        print("Радиус колес: \(self.wheelRadius)")
        print("Двери: \(self.doorState == .open ? "Открыты" : "Закрыты")")
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
enum Engine: String {
    case start = "Да", stop = "Нет"
}

//Опции
enum ChooseOptions: String {
    case full = "Обогрев зеркал, Обогрев лобового стекла, Парктроники, Аудиосистема, АБС, Турбина, Коврики"
    case medium = "Обогрев зеркал, АБС, Аудиосистема, Коврики"
    case low = "АВС, Коврики"
}

//Двери
enum DoorState {
    case open, close
}

//Прицеп
enum Trailer: String {
    case yes = "да", no = "нет"
}

//Сигнализация
enum Signaling: String {
    case openCar = "машина открыта" , closeCar = "машина закрыта"
}

//Расширение для класса машины
extension Car {
    
    func printKm(distance: Double) {
        
            let distance = km + distance
            return print("Автомобиль проехал новый участок с растоянием \(distance) км")
    }
    
    func printTrunkSize() {
        
            if trunkSize <= maxTruckSizi {
            print("Вы заполнили багажник авто на \(trunkSize) от допустимого обьема \(maxTruckSizi)")
        } else {
        print("Вы привысили норму допустимого обьема багажника в \(maxTruckSizi)")
        }
    }
}

class Car: CarProtocol {
    
    func optionsNewLow() {}
    func optionsNewMedium() {}
    func optionsNewFull() {}
    func engineStop() {}
    func engineStart() {}
    func closeDoor() {
        doorState = .close
        signaling = .closeCar
        print("ПииииПпп !!! Машина закрыта, сигнализация включена")
    }
    func openDoor() {
        doorState = .open
        signaling = .openCar
        print("ПииииПпп !!! Машина открыта, сигнализация отключена")
    }
    
    var signaling: Signaling
    var maxTruckSizi: Double = 1000.0
    var brand: Brand
    var year: Int
    var color: UIColor
    var trunkSize: Double
    var engine: Engine
    var mp3: Mp3
    var transmission: Transmission
    var km: Double = 0.0
    var maxSpeed: Int = 220
    var options: ChooseOptions
    var wheelRadius: Int = 15
    var doorState: DoorState
    
    init(brand: Brand, transmission: Transmission, options: ChooseOptions, engine: Engine, mp3: Mp3, doorState: DoorState, color: UIColor, year: Int, signaling: Signaling, trunkSize: Double) {
        self.brand = brand
        self.transmission = transmission
        self.options = options
        self.engine = engine
        self.mp3 = mp3
        self.doorState = doorState
        self.color = color
        self.year = year
        self.signaling = signaling
        self.trunkSize = trunkSize
    }
    
}

let car1 = Car(brand: .Audi, transmission: .auto, options: .full, engine: .start, mp3: .no, doorState: .close, color: .black, year: 2000, signaling: .closeCar, trunkSize: 200)
car1.printCarProperties()
car1.closeDoor()
car1.printKm(distance: 100)
car1.trunkSize = 300
car1.printTrunkSize()


extension SuperCar {
    func NewMaxSpeed (maxSpeed:Int) -> (Int) {
        self.maxSpeed = maxSpeed
        print("Установлен более мощный двигатель с максимальной скоростью \(maxSpeed) км/ч")
        return self.maxSpeed
    }
}

class SuperCar: CarProtocol {
    
    func optionsNewLow() { print("Смена комплектации запрещена") }
    func optionsNewMedium() { print("Смена комплектации запрещена") }
    func optionsNewFull() { print("Смена комплектации запрещена") }
    func engineStop() {}
    func engineStart() {}
    func closeDoor() {
        doorState = .close
        signaling = .closeCar
        print("ПииииПпп !!! Машина закрыта, сигнализация включена")
    }
    func openDoor() {
        doorState = .open
        signaling = .openCar
        print("ПииииПпп !!! Машина открыта, сигнализация отключена")
    }
    
    var signaling: Signaling
    var maxTruckSizi: Double = 500.0
    var brand: Brand
    var year: Int
    var color: UIColor
    var trunkSize: Double
    var engine: Engine
    var mp3: Mp3
    var transmission: Transmission
    var km: Double = 0.0
    var maxSpeed: Int = 420
    var options = ChooseOptions.full
    var wheelRadius: Int = 20
    var doorState: DoorState
    
    init(brand: Brand, transmission: Transmission, options: ChooseOptions, engine: Engine, mp3: Mp3, doorState: DoorState, color: UIColor, year: Int, signaling: Signaling, trunkSize: Double) {
        self.brand = brand
        self.transmission = transmission
        self.options = options
        self.engine = engine
        self.mp3 = mp3
        self.doorState = doorState
        self.color = color
        self.year = year
        self.signaling = signaling
        self.trunkSize = trunkSize
    }
    
}

let car2 = SuperCar(brand: .BMW, transmission: .auto, options: .low, engine: .stop, mp3: .yes, doorState: .close, color: .gray, year: 2020, signaling: .closeCar, trunkSize: 100)

car2.maxSpeed = 660
car2.NewMaxSpeed(maxSpeed: 800)
car2.printCarProperties()

extension TruckCar {
    func addGPS() {
        if gps == false {
            gps = true
            print("gps установлена")
        } else {
            print("у вас уже стоит gps")
        }
    }
}

class TruckCar: CarProtocol {
    func optionsNewLow() {}
    func optionsNewMedium() {}
    func optionsNewFull() {}
    func engineStop() {}
    func engineStart() {}
    func closeDoor() {
        doorState = .close
        signaling = .closeCar
        print("ПииииПпп !!! Машина закрыта, сигнализация включена")
    }
    func openDoor() {
        doorState = .open
        signaling = .openCar
        print("ПииииПпп !!! Машина открыта, сигнализация отключена")
    }
    
    var gps: Bool = false
    var signaling: Signaling
    var maxTruckSizi: Double = 500.0
    var brand: Brand
    var year: Int
    var color: UIColor
    var trunkSize: Double
    var engine: Engine
    var mp3: Mp3
    var transmission: Transmission
    var km: Double = 0.0
    var maxSpeed: Int = 420
    var options = ChooseOptions.full
    var wheelRadius: Int = 20
    var doorState: DoorState
    
    init(brand: Brand, transmission: Transmission, options: ChooseOptions, engine: Engine, mp3: Mp3, doorState: DoorState, color: UIColor, year: Int, signaling: Signaling, trunkSize: Double) {
        self.brand = brand
        self.transmission = transmission
        self.options = options
        self.engine = engine
        self.mp3 = mp3
        self.doorState = doorState
        self.color = color
        self.year = year
        self.signaling = signaling
        self.trunkSize = trunkSize
    }
}

let car3 = TruckCar(brand: .IVECO, transmission: .manual, options: .low, engine: .start, mp3: .no, doorState: .close, color: .blue, year: 1987, signaling: .closeCar, trunkSize: 1000)

car3.addGPS()
car3.printCarProperties()
