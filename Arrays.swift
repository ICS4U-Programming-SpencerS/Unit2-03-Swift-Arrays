
//  Arrays.swift
//
//  Created by Spencer Scarlett
//  Created on 2024-04-04
//  Version 1.0
//  Copyright (c) Spencer Scarlett. All rights reserved.
//
//  Change me.


import Foundation

// mean calculate
func calcMean(arrayNum: [Int]) -> Double {
    // declaring
    var mean = 0.0
    var sum = 0.0

    // runs through each item in array
    for aNum in arrayNum {
        sum += Double(aNum)
    }
    mean = sum / Double(arrayNum.count)
    // returns to main
    return mean
}

// calculates median
func calcMedian(arrayNum: [Int]) -> Double {
    // declaring
    var median = 0.0
    let aNum = arrayNum.count

    // for odd medians
    if aNum % 2 != 0 {
        median = Double(arrayNum[aNum / 2])
    } else {
        // for even medians
        median = Double(arrayNum[aNum / 2 - 1] + arrayNum[aNum / 2]) / 2.0
    }
    // return
    return median
}

// file pathway
let inputFile = "input.txt"
let outputFile = "output.txt"

// method for reading, writing and finding path
do {
    // reading input
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Can't open input file")
        exit(1)
    }

    // For file writing
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Can't return to output file")
        exit(1)
    }

    // alls reading of input file
    let inputData = input.readDataToEndOfFile()

    // converting str > int
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Can't convert inputted file to int")
        exit(1)
    }
    // splits list and converts to array
    var intList: [Int] = []
    let inputLines = inputString.components(separatedBy: .newlines)
    for str in inputLines {
        if let intValue = Int(str) {
            intList.append(intValue)
        }
    }

    // list to array convert
    var intArray = intList

    // sorts the array
    intArray.sort()

    // call functions
    let median = calcMedian(arrayNum: intArray)
    let mean = calcMean(arrayNum: intArray)

    // display done for finished program
    print("Done")

    // output writing
    let data3 = Data("The mean is:  \(mean)\n".utf8)
    output.write(data3)
    let data = Data("The median is:  \(median)\n".utf8)
    output.write(data)


    // closes for resources
    input.closeFile()
    output.closeFile()
}