import UIKit

/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

enum LibraryErrors: Error{
    case inLibraryNotThisBook
    case notEnoughMoney
}

struct Book{
    var price: Int
    var numberOfBooks: Int
}

class Library {
    var deposite = 21
    
    var bookshelf = [
        "1": Book(price: 20, numberOfBooks: 5),
        "2": Book(price: 21, numberOfBooks: 0),
        "3": Book(price: 22, numberOfBooks: 3)]
    func getTheBook(withName: String) throws {
        guard var book = bookshelf[withName] else {
            throw LibraryErrors.inLibraryNotThisBook
        }
        guard book.numberOfBooks > 0 else {
            throw LibraryErrors.inLibraryNotThisBook
        }
        guard  book.price <= deposite else {
            throw LibraryErrors.notEnoughMoney
        }
        deposite -= book.price
        book.numberOfBooks -= 1
        bookshelf[withName] = book
        print("You got the Book: \(withName)")
    }
}


let library = Library()
try? library.getTheBook(withName: "1")
library.deposite
library.bookshelf


do {
    try library.getTheBook(withName: "2")
} catch LibraryErrors.inLibraryNotThisBook {
    print("Book is not in library")
} catch LibraryErrors.notEnoughMoney{
    print("Not enough money")
}

