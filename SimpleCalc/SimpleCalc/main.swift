//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let size = args.count
        var numbers: [Int] = []
        var result = 0;
        for i in 0...size-1 {
            let arg = args[i]
            switch arg {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                numbers.append((arg as NSString).integerValue)
            case "+":
                return numbers[0] + (args[i+1] as NSString).integerValue
            case "-":
                return numbers[0] - (args[i+1] as NSString).integerValue
            case "*":
                return numbers[0] * (args[i+1] as NSString).integerValue
            case "/":
                return numbers[0] / (args[i+1] as NSString).integerValue
            case "%":
                return numbers[0] % (args[i+1] as NSString).integerValue
            case "avg":
                if numbers.count == 0 {
                    return 0
                }
                var sum = 0;
                for j in 0...numbers.count-1 {
                    sum = sum + numbers[j]
                }
                result = sum / numbers.count
            case "count":
                result = numbers.count
            case "fact":
                if numbers.count == 0 { return 0 }
                result = 1
                if numbers[0] == 0 { return result }
                else {
                    for j in (1...numbers[0]) {
                        result = result * j
                    }
                }
            default:
                print(arg)
            }
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))
