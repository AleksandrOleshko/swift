import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

enum LightColor {
    case red, white, purple, blue, black
}

protocol SizeChandelier{
    var numberOfLight: Int { get set}
    
}

struct Light: SizeChandelier {
    var color: LightColor
    var numberOfLight: Int
}

extension Light: CustomStringConvertible{
    var description: String {
        return "In сhandelier \(numberOfLight)  \(color) lights"
    }
}
   

struct Queue<T: SizeChandelier> {
    private var elements: [T] = []

    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T? {
        return elements.removeLast()
    }
    
    var sizeOfChandelier : Int{
        var numberOfLight = 0
        for element in elements {
            numberOfLight += element.numberOfLight
        }
        return numberOfLight
    }
    subscript (elements: Int ...) -> Int{
        var numberOfLight = 0
        for index in elements where index < self.elements.count {
            numberOfLight += self.elements[index].numberOfLight
        }
        return numberOfLight
    }

}

extension Queue{
    func filtred(predicate: (T) -> Bool) -> [T] {
        var myArr = [T]()
        for elem in elements {
            if predicate(elem){
                myArr.append(elem)
            }
        }
        return myArr
    }
}


var chandelierLight = Queue<Light>()

chandelierLight.enqueue(element: Light(color: .black, numberOfLight: 15))
chandelierLight.enqueue(element: Light(color: .red, numberOfLight: 10))
chandelierLight.enqueue(element: Light(color: .white, numberOfLight: 3))
chandelierLight.enqueue(element: Light(color: .blue, numberOfLight: 6))


chandelierLight[0, 1, 2, 3]
let bigChandelier = chandelierLight.filtred(predicate: {$0.numberOfLight > 8})
print(bigChandelier)
