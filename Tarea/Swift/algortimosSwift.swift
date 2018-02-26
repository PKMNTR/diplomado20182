//: Playground - noun: a place where people can play

import UIKit

func funcion(palabra: String)
{
    print("hola funcion")
}

var variable = funcion
variable("hola chavos")


////////////////// Algoritmo de numeros primos

var numDuda = 8

func isPrime(probar: Int)->Bool
{
    for i in 2..<probar
    {
        if(probar%i == 0)
        {
            return false
        }
    }
    return true
}

isPrime(probar: numDuda)

////////////////  Algoritmo de Fibonacci

func fibo(digitos: Int){
    var a = 1
    var b = 1
    var aux = 1
    for _ in 2..<digitos
    {
        aux = a+b
        a=b
        b=aux
        if(isPrime(probar: aux))
        {
            print(aux)
        }
    }
}

fibo(digitos: 100)



////////////////// Palindromo

var palindromo:String = "oso"
var checa:String = "holi"
print(palindromo)

func isPalindromo(palindromo: String)
{
    checa = String(palindromo.reversed())
    if (checa == palindromo)
    {
        print("Es palindromo")
    }
}

isPalindromo(palindromo: palindromo)

///////////////////////////String con caracteres iguales



func compCadenas(cadena1: String, cadena2:String) -> Bool
{
    if(cadena1.sorted() == cadena2.sorted() && cadena1.count == cadena2.count)
    {
        return true
    }
    else
    {
        return false
    }
}

var str1 = "abcde"
var str2 = "abdcef"

compCadenas(cadena1: str1, cadena2: str2)




