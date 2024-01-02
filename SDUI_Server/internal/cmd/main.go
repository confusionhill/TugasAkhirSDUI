package main

import "fmt"

// Problem: Expression Parsing
//
// Write a program that takes an arithmetic expression as input and determines whether the expression is well-formed. The expression consists of the following characters:
//
// Parentheses: '(', ')'
// Operators: '+', '-', '*', '/'
// "(3 + 5) * 2" is well-formed.
// "((2 * (3 + 5)) - 1)" is well-formed.
// "(4 - 2" is not well-formed because of the mismatched parentheses.
// Your program should output "Well-Formed" if the expression is well-formed and "Not Well-Formed" otherwise.
// basic math
// -(2)
func main() {
	//if Parsing("(4 - 2") {
	//	fmt.Println("well-formed")
	//} else {
	//	fmt.Println("not well-formed")
	//}
	fmt.Println(CheckIsWellFormed("(3 + 5) * 2"))
	fmt.Println(CheckIsWellFormed("((2 * (3 + 5)) - 1)"))
	fmt.Println(CheckIsWellFormed("(4 - 2"))
	fmt.Println(CheckIsWellFormed("4**4"))
	fmt.Println(CheckIsWellFormed("( )*( )"))
	fmt.Println(CheckIsWellFormed("-5*(1/4)+((1-1)*7-2)"))
	fmt.Println(CheckIsWellFormed("-5*(1/4)+((1-+1)*7-2)"))
}

func CheckIsWellFormed(txt string) string {
	if Parsing(txt) {
		return "is well-formed"
	}
	return "is not well-formed"
}

func Parsing(txt string) bool {
	validOp := map[string]bool{
		"+": true,
		"-": true,
		"*": true,
		"/": true,
	}
	prev := ""
	cntPar := []uint64{0, 0} // idx 0 = (, idx 1 = )
	for i, _ := range txt {
		c := fmt.Sprintf("%c", txt[i])
		if c == " " {
			continue
		}
		_, ok := validOp[c]
		_, okprev := validOp[prev]
		if ok && okprev {
			return false
		}
		if prev == "(" && c == ")" {
			return false
		}
		if !ok {
			if c == "(" {
				cntPar[0] += 1
			}
			if c == ")" {
				cntPar[1] += 1
			}
		}
		prev = c
	}
	return cntPar[0] == cntPar[1]
}
