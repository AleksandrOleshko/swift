import UIKit
/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
*/
enum Actions {
    case someSportCarAction
    case otherAcrion(value: Int)
}

protocol Car: AnyObject {
    var wheels: Int { get }
    var isEngineOn: Bool { get set }
    func handleAction(action: Actions)
}

extension Car {
    func handleEngine() {
        self.isEngineOn.toggle()
    }
}

class SportCar: Car {
    
    var wheels: Int = 4
    var isEngineOn: Bool = false
    func handleAction(action: Actions) {
        switch action {
        case .someSportCarAction:
            print("Простое действие")
        case .otherAcrion(value: let value):
            print("Другое действие \(value)")
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Наш автомобиль имеет \(wheels) колеса и его двигатель \(isEngineOn ? "запущен": "выключен")"
    }
}
let sc = SportCar ()
print(sc.description)
sc.handleEngine()
sc.handleAction(action: .someSportCarAction)
sc.handleAction(action: .otherAcrion(value: 101))
print(sc)
