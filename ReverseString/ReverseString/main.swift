//
//  main.swift
//  ReverseString
//
//  Created by 정현우 on 2022/04/06.

//	https://www.acmicpc.net/problem/9093
//	Success / 79508KB / 436ms

import Foundation

let inputTestStringCount = Int(readLine()!)!	// 입력할 문자열의 수 input

for _ in 1...inputTestStringCount {
	let inputString = readLine()!	// 문자열 input
	let divideBySpace = inputString.components(separatedBy: " ")	// 입력된 문자열을 공백을 기준으로 나눔
	var resultArr: [String] = []
	for char in divideBySpace {
		resultArr.append(String(char.reversed()))	// 각 단어를 뒤집어서 배열에 저장
	}
	let resultString = resultArr.joined(separator: " ") // 배열을 공백을 두고 합침
	print(resultString)
}
