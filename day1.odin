package main

import "core:fmt"
import "core:strings"
import "core:strconv"

day1 :: proc(input: string) {
    fmt.println("Day 1")
    calories := day1_proccess_input(input)
    defer delete(calories)
    day1_part1(calories)
    day1_part2(calories)
    fmt.println("----------------------------------")
}

day1_proccess_input :: proc(input: string) -> [dynamic]int {
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

day1_part1 :: proc(calories: [dynamic]int) {
    max: int = 0
    for c, i in calories {
        if c > max {
            max = c
        }
    }

    fmt.println("Part 1: ", max)
}

day1_part2 :: proc(calories: [dynamic]int) {
    max1, max2, max3: int = 0, 0, 0
    for c, i in calories {
        if c > max1 {
            max1 = c
        } else if c > max2 {
            max2 = c
        } else if c > max3 {
            max3 = c
        }
    }

    fmt.println("Part 2: ", max1 + max2 + max3)
}