package main

// More details you may find at https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D0%BD%D1%82%D1%80%D0%BE%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5_%D1%87%D0%B8%D1%81%D0%BB%D0%BE

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"unicode/utf8"
)

func main() {

	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Print(">")

		text, err := reader.ReadString('\n')
		if err != nil {
			fmt.Println("Cannot read from the console")
			os.Exit(1)
		}

		text = strings.TrimSuffix(text, "\n")

		if (text == "q") || (text == "quit") || (text == "exit") {
			os.Exit(0)
		}

		if (len(text) != 12) && (len(text) != 10) {
			fmt.Println("ERROR. The INN is incorrect")
			continue
		}

		var INN12_1 = [...]int{7, 2, 4, 10, 3, 5, 9, 4, 6, 8}
		var INN12_2 = [...]int{3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8}

		var total_1 int = 0
		var total_2 int = 0
		var last int = -1
		var prelast int = -1

		bFail := false
		for i, c := range text {
			buf := make([]byte, 1)
			_ = utf8.EncodeRune(buf, c)
			value, err := strconv.Atoi(string(buf))

			if err != nil {
				fmt.Print("ERROR. Bad INN. Characters number %v is not a digit", i)
				bFail = true
				break
			}

			if (len(text) == 10 && i == 9) || (len(text) == 12 && i == 11) {
				last = value
			}
			if len(text) == 12 && i == 10 {
				prelast = value
			}

			if len(text) == 12 {
				if i < 10 {
					total_1 += value * INN12_1[i]
					total_2 += value * INN12_2[i]
				} else if i < 11 {
					total_2 += value * INN12_2[i]
				}
			}

			if (len(text) == 10) && i < 9 {
				total_2 += value * INN12_2[i+2]
			}
		}

		if bFail {
			continue
		}

		total_1 = (total_1 % 11) % 10
		total_2 = (total_2 % 11) % 10

		if (total_2 != last) || ((len(text) == 12) && total_1 != prelast) {
			fmt.Println("BAD")
		} else {
			fmt.Println("GOOD")
		}
	}
}
