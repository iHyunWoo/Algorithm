//
//  main.swift
//  ReverseString
//
//  Created by 정현우 on 2022/04/06.

//	https://www.acmicpc.net/problem/9093
//	Success / 79508KB / 436ms

import Foundation

let inputTestStringCount = Int(readLine()!)!

for _ in 1...inputTestStringCount {
	let inputString = readLine()!
	let divideBySpace = inputString.components(separatedBy: " ")
	var resultArr: [String] = []
	for char in divideBySpace {
		resultArr.append(String(char.reversed()))
	}
	let resultString = resultArr.joined(separator: " ")
	print(resultString)
}
