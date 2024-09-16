import UIKit

/*
1) Описать несколько структур – любой легковой автомобиль и любой грузовик.
2) Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3) Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4) Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5) Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6) Вывести значения свойств экземпляров в консоль.
*/

enum engineStatus {
    case start, stop
}

enum AreWindowsOpen {
    case open, close
}

enum trunkState {
    case full, empty
}

struct car {
    let brandAuto : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "yellow":
            self.color = "yellow"
        case "blue":
            self.color = "blue"
        default:
            print("Input error")
        }
    }
    let yearOfManufacture : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brandAuto) trunk free: \(space)")
            } else { print("Input error or \(brandAuto) trunk is full")}
        }
    }
    var engineStatus : engineStatus {
        willSet {
            if newValue == .start {
                print ("\(brandAuto) engine is on")
            } else {print("\(brandAuto) engine is off")}
        }
    }
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandAuto) windows are open")
            } else { print("\(brandAuto) windows are closed") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunk() {
        self.trunkState = .empty
        print ("\(brandAuto) trunk is empty")
    }
}

struct truck {
    let brandTruck : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "yellow":
            self.color = "yellow"
        case "blue":
            self.color = "blue"
        default:
            print("Input error")
        }
    }
    let yearOfManufacture : Int
    var truckVolume : Double {
        willSet {
            if (trunkState == .empty) && (truckVolume > 0) && (truckVolume != 0) && (newValue < truckVolume) {
                let space = truckVolume - newValue
                print ("\(brandTruck) trunk free: \(space)")
            } else { print("Input error or \(brandTruck) trunk is full")}
        }
    }
    var engineStatus : engineStatus {
        willSet {
            if newValue == .start {
                print ("\(brandTruck) engine is on")
            } else {print("\(brandTruck) engine is off")}
        }
    }
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandTruck) windows are open")
            } else { print("\(brandTruck) windows are closed") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandTruck) trunck is empty")
    }
}

var car1 = car(brandAuto: "Lexus",  color: "clear", yearOfManufacture: 2020, trunkVolume: 600.0 , engineStatus: .stop, AreWindowsOpen: .open, trunkState: .empty)
var car2 = car(brandAuto: "Volvo",  color: "clear", yearOfManufacture: 2017, trunkVolume: 400.0, engineStatus: .stop, AreWindowsOpen: .close, trunkState: .full)
var truck1 = truck(brandTruck: "Mercedes",  color: "clear", yearOfManufacture: 2012, truckVolume: 1000.0, engineStatus: .start, AreWindowsOpen: .open, trunkState: .full)
var truck2 = truck(brandTruck: "Audi",  color: "clear", yearOfManufacture: 2018, truckVolume: 1500.0, engineStatus: .start, AreWindowsOpen: .close, trunkState: .empty)


car1.engineStatus = .start
car1.trunkVolume = 300.0
car1.changeColor(c: "red")
car2.trunkVolume = 800.0
car2.emptyTrunk()
car2.trunkVolume = 100.0
car2.AreWindowsOpen = .open
car2.changeColor(c: "yellow")
car2.color

truck1.engineStatus = .stop
truck1.AreWindowsOpen = .close
truck2.AreWindowsOpen = .open
truck2.engineStatus = .stop
truck2.truckVolume = 5800
truck2.changeColor(c: "white")
truck2.color
