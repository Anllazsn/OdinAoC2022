package main

import "core:fmt"
import "core:strings"
import "core:strconv"

day2 :: proc(input: string) {
    fmt.println("Day 2")
    calories := day2_proccess_input(input)
    day2_part1()
    day2_part2()
    fmt.println("----------------------------------")
}

day2_proccess_input :: proc(input: string) -> [dynamic]int {
    calories: [dynamic]int
    
    acc := 0
    for s, i in strings.split(input, "\n") {

        if strings.trim_null(s) == "" {
            append(&calories, acc)
            acc = 0
        } else {
            acc += strconv.atoi(s)
        }
    }

    return calories
}

day2_part1 :: proc() {

}

day2_part2 :: proc() {

}

