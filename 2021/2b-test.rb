#!/usr/bin/env ruby

# # commands
# # - forward 1 (horizontal)
# # - down 2 (increase depth)
# # - up 3 (decrease depth)

input = File.read('2a-test.txt').chomp.split("\n")

# split each line of input into key and value splitting on space
# input.each do |line|
#     key = line.split(" ")[0]
#     value = line.split(" ")[1]
#     puts "#{key} => #{value}"
# end


horizontal_position = 0
depth = 0 
aim = 0

# expect 15, 10 = 150

input.each do |line|
    direction = line.split(' ')[0]
    distance = line.split(' ')[1] 
    case direction
    when 'forward'
        horizontal_position += distance.to_i
        depth += aim * distance.to_i
        puts "adds #{distance} to horizontal position, a total of #{horizontal_position}"
    when 'down'
        puts "adding #{distance} to #{horizontal_position}"
        aim += distance.to_i
    when 'up'
        puts "adding #{distance} to #{horizontal_position}"
        aim -= distance.to_i
    end

end

puts "horizontal_position: #{horizontal_position}"
puts "depth: #{depth}"
puts "aim: #{aim}"
puts "total: #{horizontal_position * depth}"