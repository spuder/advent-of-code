#!/usr/bin/env ruby

# https://adventofcode.com/2020/day/6

# Get all inputs, split into array by empy line
# For every element in array, subdivide into arrays

# INPUT

#```
# abc

# a
# b
# c

# ab
# ac

# a
# a
# a
# a

# b
#````

# DESIRED OUTPUT
# [ [abc], [a,b,c], [ab,ac] ] 

input = File.read("#{__dir__}/6.input").split(/^\s*$/).collect{|group| group.strip.split(/\n/)}
p input


total = 0
# input.each do |group| 
#     puts total
#     total = total + group.join.chars.uniq.count
# end
input.collect{ |x| total = total + x.join.chars.uniq.count}
puts "------"
puts total