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

# expect 15, 10 = 150

input.each do |line|
    direction = line.split(' ')[0]
    distance = line.split(' ')[1] 
    # puts "looking at '#{direction}', '#{distance}'"
    distance = distance.to_i
    case direction
    when 'forward'
        horizontal_position += distance
    when 'down'
        depth += distance
    when 'up'
        depth -= distance
    end
end

puts "horizontal_position: #{horizontal_position}"
puts "depth: #{depth}"
puts "total: #{horizontal_position * depth}"