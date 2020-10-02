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

//Легковой автомобиль
class Car {
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
    var mp3: Mp3
    let transmission: Transmission
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Автомобиль проехал новый участок с растоянием \(distance) км")
        }
    }
    var maxSpeed = 220
    var options = ChooseOptions.full
    var wheelRadius: Int
    var doorState: DoorState
    
    static var carCount = 0
    
    init(brand: Brand, year: Int, color: UIColor, doorState: DoorState, trunkSize: Double, transmission: Transmission, km: Double, options: ChooseOptions, wheelRadius: Int, engine: Engine, mp3: Mp3) {
        self.brand = brand
        self.color = color
        self.doorState = doorState
        self.trunkSize = trunkSize
        self.transmission = transmission
        self.km = km
        self.options = options
        self.wheelRadius = wheelRadius
        self.engine = engine
        self.mp3 = mp3
        self.year = year
        
        Car.carCount += 1
    }
    
    static func carCountInfo() {
        print("Произведено автомобилей: \(self.carCount)")
    }
    
    func openDoor() {
        doorState = .open
    }
    
    func closeDoor() {
          doorState = .close
      }
    
    func engineStart() {
        engine = .start
    }
    
    func engineStop() {
          engine = .stop
      }
    
    func printDistance () {
        print ("Автомобиль проехал \(km) км")
    }
    
    //Возможность поменять комплектацию авто
    func optionsNewFull() {
            options = .full
        }
    
    func optionsNewMedium() {
            options = .medium
        }
    
    func optionsNewLow() {
            options = .low
        }
    
    func printCarProperties(car: Car) {
        print("###########################################")
        print("Марка машины: \(car.brand)")
        print("Год выпуска авто: \(car.year)")
        print("Цвет: \(car.color.name ?? "неизвестно")")
        print("Обьем багажника / кузова: \(car.trunkSize)")
        print("Запущен ли двигатель: \(car.engine.rawValue)")
        print("Поддержка мр3: \(car.mp3 == .yes ? "Да" : "Нет")")
        print("Трансмиссия: \(car.transmission == .auto ? "Автомат" : "Механика")")
        print("Пробег: \(car.km)")
        print("Максимальная скорость: \(car.maxSpeed)")
        print("Комплектация: \(car.options.rawValue)")
        print("Радиус колес: \(car.wheelRadius)")
        print("Двери: \(car.doorState == .open ? "Открыты" : "Закрыты")")
    }
    
}

//Создаем спорткар
class SportCar: Car {
    
    var modification: Modification
    var signaling: Signaling
    
    enum Modification: String {
        case yes = "да", no = "нет"
    }
    
    enum Signaling: String {
        case openCar = "машина открыта" , closeCar = "машина закрыта"
    }
    
    init(brand: Brand, year: Int, color: UIColor, doorState: DoorState, trunkSize: Double, transmission: Transmission, km: Double, options: ChooseOptions, wheelRadius: Int, engine: Engine, mp3: Mp3, modification: Modification, signaling: Signaling) {
        self.modification = modification
        self.signaling = signaling
        super.init(brand: brand, year: year, color: color, doorState: doorState, trunkSize: trunkSize, transmission: transmission, km: km, options: .full, wheelRadius: wheelRadius, engine: engine, mp3: mp3)
    }
    
    override var maxSpeed: Int {
        didSet {
            maxSpeed
            print("Установлен более мощный двигатель с максимальной скоростью \(maxSpeed) км/ч")
        }
    }
    
    override func optionsNewFull() {
        print("В спорткаре комплектиция всегда максимальная")
    }
    
    override func optionsNewMedium() {
        options = .full
        print("Изменение опций машины запрещено!")
    }
    
    override func optionsNewLow() {
        options = .full
    }
    
    //Блокируем / раблокируем машину и двери
    override func openDoor() {
        doorState = .open
        signaling = .openCar
        print("ПииииПпп !!! Машина открыта, сигнализация отключена")
    }
    
    override func closeDoor() {
        doorState = .close
        signaling = .closeCar
        print("ПииииПпп !!! Машина закрыта, сигнализация включена")
      }
    
    func printCarProperties(car: SportCar) {
        print("###########################################")
        print("Марка машины: \(car.brand)")
        print("Год выпуска авто: \(car.year)")
        print("Цвет: \(car.color.name ?? "неизвестно")")
        print("Обьем багажника / кузова: \(car.trunkSize)")
        print("Запущен ли двигатель: \(car.engine.rawValue)")
        print("Поддержка мр3: \(car.mp3 == .yes ? "Да" : "Нет")")
        print("Трансмиссия: \(car.transmission == .auto ? "Автомат" : "Механика")")
        print("Пробег: \(car.km)")
        print("Максимальная скорость: \(car.maxSpeed)")
        print("Комплектация: \(car.options.rawValue)")
        print("Радиус колес: \(car.wheelRadius)")
        print("Машина: \(car.doorState == .open ? "Открыта и снята с сигнализации" : "Закрыта, и на сигнализации")")
        print("Модификация машины откидного верха (кабриолет): \(car.modification.rawValue)")
    }
    
}

//Создаем грузовую машину
class TrankCar: Car {
    
    var trailer: Trailer
    var gps: Bool = true
    
    init(brand: Brand, year: Int, color: UIColor, doorState: DoorState, trunkSize: Double, transmission: Transmission, km: Double, options: ChooseOptions, wheelRadius: Int, engine: Engine, mp3: Mp3, trailer: Trailer, gps: Bool) {
        self.trailer = trailer
        self.gps = gps
        super.init(brand: brand, year: year, color: color, doorState: doorState, trunkSize: trunkSize, transmission: transmission, km: km, options: options, wheelRadius: wheelRadius, engine: engine, mp3: mp3)
    }
    
    override func optionsNewFull() {
        options = .full
        trailer = .yes
        mp3 = .yes
        print("Прицеп идет в комплекте с максимальной комплектацией")
        }
    
    override func optionsNewMedium() {
        options = .medium
        trailer = .no
        mp3 = .yes
        print("Прицеп в комплекте не идет, но идет мр3")
        }
    
    override func optionsNewLow() {
        options = .low
        trailer = .no
        mp3 = .no
        }
    
    //Функция проверяет налицие gps и если его нет, то устанавливает и сообещает об этом. Если gps уже стоит то пишет что оно там есть
    func addGPS() {
        if gps == false {
            gps = true
            print("gps установлена")
        } else {
            print("у вас уже стоит gps")
        }
    }
    
    func printCarProperties(car: TrankCar) {
        print("###########################################")
        print("Марка машины: \(car.brand)")
        print("Год выпуска авто: \(car.year)")
        print("Цвет: \(car.color.name ?? "неизвестно")")
        print("Обьем багажника / кузова: \(car.trunkSize)")
        print("Запущен ли двигатель: \(car.engine.rawValue)")
        print("Поддержка мр3: \(car.mp3 == .yes ? "Да" : "Нет")")
        print("Трансмиссия: \(car.transmission == .auto ? "Автомат" : "Механика")")
        print("Пробег: \(car.km)")
        print("Максимальная скорость: \(car.maxSpeed)")
        print("Комплектация: \(car.options.rawValue)")
        print("Радиус колес: \(car.wheelRadius)")
        print("Машина: \(car.doorState == .open ? "Открыта и снята с сигнализации" : "Закрыта, и на сигнализации")")
        print("Наличие прицепа: \(car.trailer.rawValue)")
        print("Наличие gps: \(car.gps ? "да" : "нет")")
    }
}



//Приступаем к созданию машин и тестированию функций

let car2 = Car(brand: .Ford, year: 2010, color: .blue, doorState: .close, trunkSize: 1111, transmission: .auto, km: 0, options: .medium, wheelRadius: 16, engine: .start, mp3: .yes)

let car1 = SportCar(brand: .Acura, year: 2001, color: .blue, doorState: .close, trunkSize: 100, transmission: .manual, km: 0, options: .medium, wheelRadius: 10, engine: .stop, mp3: .yes, modification: .yes, signaling: .closeCar)

let car3 = TrankCar(brand: .IVECO, year: 1980, color: .clear, doorState: .close, trunkSize: 10000, transmission: .auto, km: 0, options: .low, wheelRadius: 25, engine: .stop, mp3: .no, trailer: .yes, gps: true)

car1.printCarProperties(car: car1)
car2.printCarProperties(car: car2)

car1.optionsNewLow()
print("###########################################")
car1.optionsNewMedium()
print("###########################################")
car1.openDoor()

car1.printCarProperties(car: car1)
print("###########################################")
car1.closeDoor()
print("###########################################")
car1.maxSpeed = 500

car1.printCarProperties(car: car1)

car3.printCarProperties(car: car3)
print("###########################################")
car3.addGPS()
print("###########################################")
Car.carCountInfo()
print("###########################################")
car3.trailer = .no
car3.optionsNewFull()
car3.printCarProperties(car: car3)
