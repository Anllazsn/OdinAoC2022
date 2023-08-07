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
}