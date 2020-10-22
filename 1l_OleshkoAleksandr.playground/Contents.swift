import UIKit

//1. Решение квадратного уравнения ax2+bx+c=0

var a,b,c,Dis,x1,x2: Double

a = 2
b = 4
c = 2

Dis = (b*b) - (4*a*c)
    if Dis > 0 {x1 = (-b + sqrt(Dis)) / (2*a)
                x2 = (-b - sqrt(Dis)) / (2*a)
        print("x1 =", x1)
        print("x2 =", x2)
    }
    else { if Dis == 0 {x1 = (-b) / (2*a)
        print("x1=x2", x1)}
        else {
        print("Уравнение не имеет корней")
        }}

//2. Задание с катетами

var cat1,cat2,gipho,S,P: Double

cat1 = 13
cat2 = 8

S = (cat1*cat2)/2
gipho = sqrt((cat1*cat1) + (cat2*cat2))
P = cat1 + cat2 + gipho
            
print("Площадь равна", S)
print("Гипотенуза равна", gipho)
print("Периметр равен", P)

//3. Вклад через 5 лет

var sum,percent,total,t: Double

sum = 1_000_000
t = 5
percent = 15

total = sum + (sum*percent/100*t)
print("Сумма вклада через пять лет равна=", total)
