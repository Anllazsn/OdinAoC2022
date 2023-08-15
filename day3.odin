package main

import "core:fmt"
import "core:strings"
import "core:strconv"

day3 :: proc(input: string) {
    fmt.println("Day 3")
    rucksacks := day3_proccess_input(input)
    defer delete(rucksacks)
    day3_part1(rucksacks)
    day3_part2(rucksacks)
    fmt.println("----------------------------------")
}

day3_proccess_input :: proc(input: string) -> [dynamic]string {
    rucksacks: [dynamic]string
    
    for row, i in strings.split(input, "\n") {
        if s := strings.trim_null(row); s != "" {
            append(&rucksacks, s)
        }
    }

    return rucksacks
}

day3_part1 :: proc(rucksacks: [dynamic]string) {
    sum := 0
    for r, _ in rucksacks {
        f_compat := r[:len(r) / 2]
        s_compat := r[len(r) / 2:]

        equality: for f, _ in f_compat {
            for s, _ in s_compat {
                if f == s {
                    sum += rune_to_priority(f)
                    break equality
                }
            }
        }
    }

    fmt.println("Part 1: ", sum)
}

day3_part2 :: proc(rucksacks: [dynamic]string) {
    badge := 0
    for i := 0; i < len(rucksacks); i += 1 {
        one   := rucksacks[i]
        two   := rucksacks[i+1]
        three := rucksacks[i+2]
        i += 2 // Update i

        rune_badge: for rune_one in one {
            for rune_two in two {
                for rune_three in three {
                    if rune_one == rune_two && rune_one == rune_three {
                        badge += rune_to_priority(rune_one)
                        break rune_badge
                    }
                }
            }
        }

    }

    fmt.println("Part 2: ", badge)
}

rune_to_priority :: proc(letter: rune) -> int {
    if c := int(letter); c > 96 {
        return c - 96
    } else if c < 96 {
        return c - 64 + 26
    }
    return 0
}
