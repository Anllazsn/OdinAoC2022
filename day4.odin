package main

import "core:fmt"
import "core:strings"
import "core:strconv"

day4 :: proc(input: string) {
    fmt.println("Day 4")
    rucksacks := day4_proccess_input(input)
    defer delete(rucksacks)
    day4_part1(rucksacks)
    day4_part2(rucksacks)
    fmt.println("----------------------------------")
}

day4_proccess_input :: proc(input: string) -> [dynamic]string {
    rucksacks: [dynamic]string
    
    for row, i in strings.split(input, "\n") {
        if s := strings.trim_null(row); s != "" {
            append(&rucksacks, s)
        }
    }

    return rucksacks
}

day4_part1 :: proc(rucksacks: [dynamic]string) {
    sum := 0

    fmt.println("Part 1: ", sum)
}

day4_part2 :: proc(rucksacks: [dynamic]string) {
    badge := 0

    fmt.println("Part 2: ", badge)
}
