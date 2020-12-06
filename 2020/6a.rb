#!/usr/bin/env ruby

# https://adventofcode.com/2020/day/6

# Get all inputs, split into array by empy line
# For every element in array, subdivide into arrays

input = File.read("./6.input").split(/^\s*$/).map! {|foo| foo.split('\\n').map!{|bar| bar.strip}}
# input.each do |group| 
#     group.map! { |person| person.split('\\n')}
# end

puts input.to_s