//
//  main.swift
//  Stack2
//
//  Created by 정현우 on 2022/04/06.

//	https://www.acmicpc.net/problem/10828
//	Success / 79512KB / 28ms

import Foundation

struct Stack {
	var stack: [Int] = []
	
	mutating func push(_ num: Int) {
		stack.append(num)
	}
	mutating func pop() -> Int {
		if stack.isEmpty {
			return -1
		} else {
			return stack.removeLast()
		}
	}
	func size() -> Int {
		return stack.count
	}
	func empty() -> Int {
		if stack.isEmpty {
			return 1
		} else {
			return 0
		}
	}
	func top() -> Int {
		if stack.isEmpty {
			return -1
		} else {
			return stack[stack.count - 1]
		}
	}
}

var stack = Stack()
let inputCommandCount = Int(readLine()!)!

for _ in 1...inputCommandCount {
	let command = readLine()!
	switch command {
	case "pop":
		print(stack.pop())
	case "size":
		print(stack.size())
	case "empty":
		print(stack.empty())
	case "top":
		print(stack.top())
	default:
		let startIndex = command.index(command.startIndex, offsetBy: 5)
		let range = startIndex...
		let num = Int(command[range])!
		stack.push(num)
	}
}


