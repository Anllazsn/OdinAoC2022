package main

import "core:fmt"
import "core:strings"
import "core:strconv"

ROCK :: 1
PAPER :: 2
SCISSOR :: 3

LOSE :: 0
DRAW :: 3
WIN :: 6

day2 :: proc(input: string) {
    fmt.println("Day 2")
    strategies := day2_proccess_input(input)
    defer free(&strategies)
    day2_part1(strategies)
    day2_part2(strategies)
    fmt.println("----------------------------------")
}

day2_proccess_input :: proc(input: string) -> [dynamic]string {
    strategies: [dynamic]string
    
    for row, i in strings.split(input, "\n") {
        if s := strings.trim_null(row); s != "" {
            append(&strategies, s)
        }
    }

    return strategies
}

day2_part1 :: proc(strategies: [dynamic]string) {
    score := 0
    for strat, _ in strategies {
        switch strat {
            case "A X": score += ROCK + DRAW 
            case "A Y": score += PAPER + WIN
            case "A Z": score += SCISSOR + LOSE
            case "B X": score += ROCK + LOSE
            case "B Y": score += PAPER + DRAW
            case "B Z": score += SCISSOR + WIN
            case "C X": score += ROCK + WIN
            case "C Y": score += PAPER + LOSE
            case "C Z": score += SCISSOR + DRAW
        }
    }

    fmt.println("Part 1: ", score)
}

day2_part2 :: proc(strategies: [dynamic]string) {
    score := 0
    for strat, _ in strategies {
        switch strat {
            case "A X": score += SCISSOR + LOSE 
            case "A Y": score += ROCK + DRAW
            case "A Z": score += PAPER + WIN
            case "B X": score += ROCK + LOSE
            case "B Y": score += PAPER + DRAW
            case "B Z": score += SCISSOR + WIN
            case "C X": score += PAPER + LOSE
            case "C Y": score += SCISSOR + DRAW
            case "C Z": score += ROCK + WIN
        }
    }

    fmt.println("Part 2: ", score)
}

