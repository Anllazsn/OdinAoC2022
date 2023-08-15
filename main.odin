package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"

readFile :: proc(filename: string) -> string {
    data, succ := os.read_entire_file_from_filename(filename)
    if !succ {
        fmt.panicf("Error opening file: %s", filename)
    }

    return string(data)
}

main :: proc() {
    day1(readFile("inputs/day1.txt"))
    day2(readFile("inputs/day2.txt"))
    day3(readFile("inputs/day3.txt"))
    day4(readFile("inputs/day4.txt"))
    day5(readFile("inputs/day5.txt"))
}