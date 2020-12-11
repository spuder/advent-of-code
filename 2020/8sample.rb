#!/usr/bin/env ruby

input = File.readlines("#{__dir__}/8.sample").map {|x| x.strip}

p input


commands_run = [] 
accumulator=0
next_command = 0
while (not commands_run.include? next_command)
    commands_run << next_command
    com = input[next_command].split(/\s/)
    case com[0]
    when 'nop'
        next_command = next_command + 1
    when 'acc'
        accumulator = accumulator + com[1].to_i
        next_command = next_command + 1
    when 'jmp'
        next_command = next_command + com[1].to_i
    end
end

p commands_run
puts accumulator