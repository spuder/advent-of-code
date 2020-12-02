#!/usr/bin/env ruby
input = File.read("./2.input").split("\n")
count = 0
input.each do |i| 
    policy = i.split[0]
    policy_min = policy.split('-')[0].to_i
    policy_max = policy.split('-')[1].to_i
    letter = i.split[1]
    password = i.split[2]

    pass_count = password.count(letter)
    if (pass_count >= policy_min) && (pass_count <= policy_max)
        puts "+ #{password}"
        count = count +1
    else
        puts "- #{password}"
    end
end
puts count