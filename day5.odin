package main

import "core:fmt"
import "core:strings"
import "core:strconv"

Stack :: struct {
    crates: [dynamic]rune
}

day5 :: proc(input: string) {
    fmt.println("Day 5")
    stacks: [dynamic]Stack
    stack1 := Stack{ {'V', 'C', 'D', 'R', 'Z', 'G', 'B', 'W'} }
    stack2 := Stack{ {'G', 'W', 'F', 'C', 'B', 'S', 'T', 'V'} }
    stack3 := Stack{ {'C', 'B', 'S', 'N', 'W'} }
    stack4 := Stack{ {'Q', 'G', 'M', 'N', 'J', 'V', 'C', 'P'} }
    stack5 := Stack{ {'T', 'S', 'L', 'F', 'D', 'H', 'B'} }
    stack6 := Stack{ {'J', 'V', 'T', 'W', 'M', 'N'} }
    stack7 := Stack{ {'P', 'F', 'L', 'C', 'S', 'T', 'G'} }
    stack8 := Stack{ {'B', 'D', 'Z'} }
    stack9 := Stack{ {'M', 'N', 'Z', 'W'} }
    append(&stacks, stack1)
    append(&stacks, stack2)
    append(&stacks, stack3)
    append(&stacks, stack4)
    append(&stacks, stack5)
    append(&stacks, stack6)
    append(&stacks, stack7)
    append(&stacks, stack8)
    append(&stacks, stack9)

    commands := day5_proccess_input(input)
    
    defer delete(stacks)
    defer delete(commands)
    day5_part1(commands, stacks)
    day5_part2(commands)
    fmt.println("----------------------------------")
}

day5_proccess_input :: proc(input: string) -> [dynamic]string {
    commands: [dynamic]string
    str := strings.split(input, "\n")
    
    for i := 9; i < len(str); i +=1  {
        if s := strings.trim_null(str[i]); s != "" {
            append(&commands, s)
        }
    }

    return commands
}

day5_part1 :: proc(commands: [dynamic]string, stacks: [dynamic]Stack) {
    top: string
    acc := 0

    for cmd, _ in commands {
        qtd, from, to := day5_move(cmd)
        
        for i := 1; i <= qtd; i += 1 {
            rune_from := pop(&stacks[from - 1].crates)
            append(&stacks[to - 1].crates, rune_from)
        }
    }
    
    top = day5_top_crates(stacks)

    fmt.println("Part 1: ", top)
}

day5_part2 :: proc(commands: [dynamic]string) {
    acc := 0

    fmt.println("Part 2: ", acc)
}

day5_move :: proc(str: string) -> (qtd, from, to: int) {
    spl := strings.split(str, " ")
    
    qtd  = strconv.atoi(spl[1])
    from = strconv.atoi(spl[3])
    to   = strconv.atoi(spl[5])

    return
}

day5_top_crates :: proc(stacks: [dynamic]Stack) -> string{
    builder := strings.builder_make()
    for s, _ in stacks {
        strings.write_rune(&builder, s.crates[len(s.crates) - 1])
    }
    return strings.to_string(builder)
}