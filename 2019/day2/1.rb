# @memory = [1,9,10,3,2,3,11,0,99,30,40,50]
# @memory = [1,0,0,0,99]
# @memory = [2,3,0,3,99]
# @memory = [2,4,4,5,99,0]
# @memory = [1,1,1,4,99,5,6,0,99]
# @memory = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,13,19,1,9,19,23,2,13,23,27,2,27,13,31,2,31,10,35,1,6,35,39,1,5,39,43,1,10,43,47,1,5,47,51,1,13,51,55,2,55,9,59,1,6,59,63,1,13,63,67,1,6,67,71,1,71,10,75,2,13,75,79,1,5,79,83,2,83,6,87,1,6,87,91,1,91,13,95,1,95,13,99,2,99,13,103,1,103,5,107,2,107,10,111,1,5,111,115,1,2,115,119,1,119,6,0,99,2,0,14,0]
@memory = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,13,19,1,9,19,23,2,13,23,27,2,27,13,31,2,31,10,35,1,6,35,39,1,5,39,43,1,10,43,47,1,5,47,51,1,13,51,55,2,55,9,59,1,6,59,63,1,13,63,67,1,6,67,71,1,71,10,75,2,13,75,79,1,5,79,83,2,83,6,87,1,6,87,91,1,91,13,95,1,95,13,99,2,99,13,103,1,103,5,107,2,107,10,111,1,5,111,115,1,2,115,119,1,119,6,0,99,2,0,14,0]

instruction_pointer = 0

def add(parameter1, parameter2, output)
    @memory[output] = @memory[parameter1] + @memory[parameter2]
end

def multiply(parameter1, parameter2, output)
    @memory[output] = @memory[parameter1] * @memory[parameter2]
end

# Itterate over all lines in program
while instruction_pointer < @memory.length
    parameter1 = @memory[instruction_pointer+1] #TODO: validate not overrun
    parameter2 = @memory[instruction_pointer+2]
    output = @memory[instruction_pointer+3]

    case @memory[instruction_pointer]
    when 1
        add(parameter1, parameter2, output)
    when 2
        multiply(parameter1, parameter2, output)
    when 99
        break
    else
        raise "Invalid operator #{@memory[instruction_pointer]}"
    end
    instruction_pointer = instruction_pointer + 4
end
puts @memory