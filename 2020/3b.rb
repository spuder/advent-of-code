#!/usr/bin/env ruby
def get_data 
    input = []
    File.readlines("./3.input").each do |line|
        input << line.strip.split(//)
    end
    return input
end

input = get_data



slopes=[
    [1,1],
    [3,1],
    [5,1],
    [7,1],
    [1,2]
]

trees = 0
answer = []
slopes.each_with_index do |slope, index|
    column_index=0
    row_index=0
    puts "index is #{index}"
    puts "slope is #{slope}"
    (0...input.length).step(slope[1]) do | row|
    if input[row][column_index] == '.'
        input[row][column_index] = 'O'
    elsif input[row][column_index] == '#'
        input[row][column_index] = 'X'
        trees = trees +1
    else
        raise "invalid value '#{input[row][column_index]}'"
        # break
    end 
    column_index = column_index + slope[0]
    column_index = column_index - 31 if column_index >= 31
end

    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    input.each do |i|
        puts i.join
    end
    answer << trees
    trees = 0 
    input = get_data

end

puts "answer is #{answer}"
puts "answer total is #{answer.inject(:*)}"


# 776826288 (too low)
# 3316272960 (correct)