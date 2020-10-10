import UIKit

struct Cars {
    var brand: String
    var age: Int
}

extension Cars: CustomStringConvertible {
    var description : String {
    return "Name: \(brand), Age: \(age)"
    }
}

struct VisitLog {
    var name: String
    var age: Int
}

extension VisitLog: CustomStringConvertible {
    var description : String {
    return "Name: \(name), Age: \(age)"
    }
}

struct Queue <T> {
    
    private var elements: [T] = []

    mutating func push(element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeLast()
    }
    
    func printMyQueue() {
           print(elements)
       }
    
}

extension Queue {
    func filter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
    
    //Показывает количество элементов
    subscript() -> () {
        print("Мы имеем элементов", self.elements.count)
    }
    
}


var queue1 = Queue<Cars>()
queue1.push(element: .init(brand: "BMW", age: 1990))
queue1.push(element: .init(brand: "Honda", age: 1980))
queue1.pop()
queue1.pop()
queue1.pop()

var queue2 = Queue<VisitLog>()
queue2.push(element: .init(name: "Alex", age: 12))
queue2.push(element: .init(name: "Bob", age: 33))
queue2.push(element: .init(name: "Mary", age: 12))
queue2.push(element: .init(name: "Bill", age: 45))
queue2.push(element: .init(name: "Tommy", age: 13))
queue2.push(element: .init(name: "Sara", age: 11))
queue2.push(element: .init(name: "Joe", age: 54))

queue2.printMyQueue()
var queue3 = queue2.filter(predicate: {$0.age == 12})
print(queue3)

queue2[]
queue1[]
