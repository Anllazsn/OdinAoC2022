package main

import "core:fmt"
import "core:strings"
import "core:strconv"

day4 :: proc(input: string) {
    fmt.println("Day 4")
    assigments := day4_proccess_input(input)
    defer delete(assigments)
    day4_part1(assigments)
    day4_part2(assigments)
    fmt.println("----------------------------------")
}

day4_proccess_input :: proc(input: string) -> [dynamic]string {
    assigments: [dynamic]string
    
    for row, i in strings.split(input, "\n") {
        if s := strings.trim_null(row); s != "" {
            append(&assigments, s)
        }
    }

    return assigments
}

day4_part1 :: proc(assigments: [dynamic]string) {
    acc := 0
	for row, _ in assigments {
		pairs := strings.split(row, ",")
		assign_a := pairs[0]
		assign_b := pairs[1]

		a := strings.split(assign_a, "-")
		b := strings.split(assign_b, "-")

		min_a := strconv.atoi(a[0])
		max_a := strconv.atoi(a[1])
		min_b := strconv.atoi(b[0])
		max_b := strconv.atoi(b[1])

		if min_a <= min_b && max_a >= max_b {
			acc += 1
			continue
		} else if min_b <= min_a && max_b >= max_a {
			acc += 1
			continue
		}
	}

    fmt.println("Part 1: ", acc)
}

day4_part2 :: proc(assigments: [dynamic]string) {
    acc := 0
	for row, _ in assigments {
		pairs := strings.split(row, ",")
		assign_a := pairs[0]
		assign_b := pairs[1]

		a := strings.split(assign_a, "-")
		b := strings.split(assign_b, "-")

		min_a := strconv.atoi(a[0])
		max_a := strconv.atoi(a[1])
		min_b := strconv.atoi(b[0])
		max_b := strconv.atoi(b[1])

		if (min_a >= min_b && min_a <= max_b) || (max_a >= min_b && max_a <= max_b) {
			acc += 1
			continue
		} else if (min_b >= min_a && min_b <= max_a) || (max_b >= min_a && max_b <= max_a) {
			acc += 1
			continue
		}
	}

    fmt.println("Part 2: ", acc)
}
