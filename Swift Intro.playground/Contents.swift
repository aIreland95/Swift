import UIKit

// Aaron Ireland
// Intro to Swift
// December 15, 2018

//----------------------Even or Odd Function----------------------

func evenOrOdd(value: Int) -> String { // function declaration, checks if value passed in is even or odd
    
    let evenOutput = "Foo" // return strings for odd or even output
    let oddOutput = "Bar"
    
    if ((value % 2) == 0 && (value % 3) == 0) { // checks if the number is divisible by 2 and 3 without a remainder
        return "\(evenOutput)\(oddOutput)"
    }
    else if ((value % 2) == 0) { // checks if the number is divisible by 2 only, without a remainder
        return "\(evenOutput)"
    }
    else if ((value % 2) != 0) { // checks if the number is divisible by 2 only, which results in a remainder
        return "\(oddOutput)"
    }
    return ""
}

//--------------------Greeting (Hello) Function--------------------

func greeting(name: String?) { // function declaration, prints a greeting based on the name passed in
    
    if name == nil { // checks if the name is empty or nil
        print("Who's there?")
    }
    else {
        
        if (name == "John" || name == "Andrea") { // checks if name is "John" or "Andrea," prints out unique message
            print("Hello, " + name! + ", long time no see!")
        }
        else { // checks if name is not "John" or "Andrea," simply prints "Hello {name}!"
            print("Hello, " + name!)
        }
    }
}

//--------------------Sum of Consecutive Numbers Function----------------------

func sumConsecutive(n: Int) { // function declaration, adds consecutive numbers based on the value (n) passed in
    
    var start = 1 // starting value for the other number to be added (first being the number passed in)
    
    while start <= n { // while loop, continues while start is not greater than n
        
        let sum = (start + n) // constant declaration, calculates the sum of start and n
        
        print(sum)
        
        if (sum > 100) { // checks if the sum is greater than 100, prints out "Woah" if found true
            
            print("Woah")
        }
        
        start += 1 // increment start by 1
    }
}

//-----------------Fibonacci Function---------------------

func fibonacci() { // function declaration, proceeds through the fibonacci sequence
    
    let limit = 1000 // variable declarations, a limit, two variables, and a sum variable (first + second)
    var first = 0
    var second = 1
    var sum = (first + second)
    
    while sum <= limit { // while loop, checks if the sum has exceeded the limit, end s if sum is greater than 1000
        
        print(sum)
        
        first = second // reset variables, set first to second, second to sum, and recalculates the sum
        second = sum
        sum = (first + second)
    }
    
}

//--------------------Function Call Tests (Main)--------------------

print("-----Even or Odd-----")
print(evenOrOdd(value: 8)) // function calls passing in different values
print(evenOrOdd(value: 9))
print(evenOrOdd(value: 12))

print("-----Greeting-----")
greeting(name: "John") // function calls passing in different names
greeting(name: "Daryl")
greeting(name: "Andrea")
greeting(name: nil)

print("-----Sum of Consecutive-----")
sumConsecutive(n: 12) // function calls passing in different values for n
sumConsecutive(n: 40)
sumConsecutive(n: 64)

print("-----Fibonacci Sequence-----")
fibonacci() // function call, no parameters necessary
