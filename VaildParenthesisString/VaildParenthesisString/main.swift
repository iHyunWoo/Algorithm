//
//  main.swift
//  VaildParenthesisString
//
//  Created by 정현우 on 2022/04/08.

//	https://www.acmicpc.net/problem/9012
//	Success / 79512KB / 12ms

import Foundation

struct Stack<T> {
	var stack: [T] = []
	
	mutating func push(_ contents: T) {
		stack.append(contents)
	}
	
	mutating func pop() -> T! {
		return stack.popLast()
	}
}

let inputStringCount = Int(readLine()!)!

for _ in 1...inputStringCount {
	var myStack = Stack<Character>()
	let inputString = readLine()!
	var errorPoint = false
	for i in inputString {
		if i == "(" {
			myStack.push(i)
		}
		else if i == ")" {
			if myStack.stack.isEmpty {
				errorPoint = true
			} else {
				myStack.pop()
			}
		}
	}
	if errorPoint {
		print("NO")
		continue
	}
	
	if myStack.stack.isEmpty {
		print("YES")
	} else {
		print("NO")
	}
}


