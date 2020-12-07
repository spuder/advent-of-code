#!/usr/bin/env ruby

# https://adventofcode.com/2020/day/6

input = File.read("#{__dir__}/6.input").split(/^\s*$/).collect{|group| group.strip.split(/\n/)}
p input

# input.each do |group|
#     # Itterate though every array element
#     # Increment if array element appears in every other array
#     # If array contains just 1 person, add all their answers to the list
#     case
#     when group.length == 1
#         total = toal + group.length
#     else
#         # Loop over every array element
#         # Loop over every 
#     end    
# end
# input.collect{ |x| total = total + x.join.chars.uniq.count}


puts "---------"

# Credit https://www.reddit.com/r/adventofcode/comments/k7ndux/2020_day_06_solutions/gev0hjz?utm_source=share&utm_medium=web2x&context=3
# foo = input[2].map(&:chars).reduce(&:&)
# https://stackoverflow.com/a/13093737/1626687
answer = input.map {|group| group.map{|x| x.chars}.reduce(:&).length }.sum

puts answer