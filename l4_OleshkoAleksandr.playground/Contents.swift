import UIKit

/*
 1) Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2) Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3) Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4) В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5) Создать несколько объектов каждого класса. Применить к ним различные действия.
 6) Вывести значения свойств экземпляров в консоль */

enum CarEngineState{
    case on, off
}

enum CarDoorState{
    case open, close
}
class Car {
    let color: UIColor
    let brand: String
    let numberOfDoors: Int
    let numberOfWheels: Int
    var engineState: CarEngineState
    var doorState: CarDoorState

    init(color: UIColor, brand: String, numberOfDoors: Int, numberOfWheels: Int, engineState: CarEngineState, doorState: CarDoorState) {
        self.color = color
        self.brand = brand
        self.numberOfDoors = numberOfDoors
        self.numberOfWheels = numberOfWheels
        self.engineState = engineState
        self.doorState = doorState
    }
    
    func openDoors() {
        doorState = .open
        print("Closed doors")
    }
    func closetDoors(){
        doorState = .close
    }
}

class SportCar: Car{
    var maxSpeed: Int
    init(maxSpeed: Int, color: UIColor, brand: String, numberOfDoors: Int, numberOfWheels: Int, engineState: CarEngineState, doorState: CarDoorState){
        self.maxSpeed = maxSpeed
        super.init(color: color, brand: brand, numberOfDoors: numberOfDoors, numberOfWheels: numberOfWheels, engineState: engineState, doorState: doorState)
    }
    
    override func openDoors() {
        super.openDoors()
        print("Закройте двери!")
    }
}

class Truck: Car{
    var fillTrunk: Bool
    var heigtCabin: Double
    
    init(fillTrunk: Bool, heigtCabin: Double, color: UIColor, brand: String, numberOfDoors: Int, numberOfWheels: Int, engineState: CarEngineState, doorState: CarDoorState){
        self.fillTrunk = fillTrunk
        self.heigtCabin = heigtCabin
        super.init(color: color, brand: brand, numberOfDoors: numberOfDoors, numberOfWheels: numberOfWheels, engineState: engineState, doorState: doorState)
    }
}
var car1 = SportCar(maxSpeed: 320, color: .yellow , brand: "Audi", numberOfDoors: 5, numberOfWheels: 4, engineState: .on, doorState: .open)
print(car1.brand)
print(car1.doorState)
print(car1.openDoors())
