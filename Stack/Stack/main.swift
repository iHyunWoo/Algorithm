//
//  main.swift
//  Stack
//
//  Created by 정현우 on 2022/04/06.

//	https://www.acmicpc.net/problem/10828
//	Success / 79512KB / 28ms

import Foundation


let inputCommandCount = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...inputCommandCount {
	let command = readLine()!
	switch command {
	case "pop":
		pop()
	case "size":
		size()
	case "empty":
		empty()
	case "top":
		top()
	default:
		let startIndex = command.index(command.startIndex, offsetBy: 5)
		let range = startIndex...
		let num = Int(command[range])!
		push(num)
	}
}

func push(_ X: Int) {
	stack.append(X)
}

func pop() {
	if stack.isEmpty {
		print(-1)
	} else {
		let num = Int(stack[stack.count - 1])
		stack.removeLast()
		print(num)
	}
}

func size() {
	print(stack.count)
}

func empty() {
	if stack.isEmpty {
		print(1)
	} else {
		print(0)
	}
}

func top(){
	if stack.isEmpty {
		print(-1)
	} else {
		print(stack[stack.count - 1])
	}
}



