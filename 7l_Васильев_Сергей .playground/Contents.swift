import UIKit
import Foundation

//Варианты ошибок
enum CreditCardError: Error {
    case NoMoney (noMoney: Double)
    case CreditCardBlocked
}

//Расширения для ошибок
extension CreditCardError: CustomStringConvertible {
    var description: String {
        switch self {
        case .NoMoney: return "На карте недостаточно спедств для проведения этой операции."
        case .CreditCardBlocked: return "Ваша карта заблокирована."
        }
        
    }
}

//Какой-то товар
struct SomeShop {
    var price: Double
}

//Наша карта
struct BankCard {
    let limitMoney = -50000.0
    var balance = 0.0
    var cardBlock = false
    
    //Проверка перед покуркой
    func buy(some: SomeShop) throws {
        guard cardBlock == false else { throw CreditCardError.CreditCardBlocked }
        
        guard some.price <= (limitMoney + self.balance) else {
            if balance < 0 {
                throw CreditCardError.NoMoney (noMoney: some.price + limitMoney + balance)
            } else {
                throw CreditCardError.NoMoney (noMoney: some.price + limitMoney - balance)
            }
        }
    }
    
    //Функция пополнения баланса
    mutating func depositeMoney (someMoney: Double) {
        balance = self.balance + someMoney
    }
    
    //Функция узнать баланс карты
    func printBalance() {
        print ("Ваш баланс \(balance) рублей")
    }
    
    //Блокировка карты
    mutating func changeCard(cardBlock: Bool) {
        switch cardBlock {
        case true:
            self.cardBlock = true
        case false:
            self.cardBlock = false
        }
    }
}

//Создаем товар и банковскую карту
var someShop = SomeShop(price: 10000)
var cardSale = BankCard()

//Проверяем баланс и пополняем карту
cardSale.printBalance()
cardSale.depositeMoney(someMoney: 300000)
cardSale.printBalance()

//Пытаемся купить товар
do {
    try cardSale.buy(some: .init(price: 10000))
} catch let error as CreditCardError {
    print(error.description)
}

do {
    try cardSale.buy(some: .init(price: 40000))
} catch let error as CreditCardError {
    print(error.description)
}

//Делаем отрицательный баланс
cardSale.depositeMoney(someMoney: -330000)
cardSale.printBalance()

do {
    try cardSale.buy(some: .init(price: 1000))
} catch let error as CreditCardError {
    print(error.description)
}

//Блокируем карту
cardSale.changeCard(cardBlock: true)

do {
    try cardSale.buy(some: .init(price: 1000))
} catch let error as CreditCardError {
    print(error.description)
}
