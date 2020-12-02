#!/usr/bin/env ruby
input = File.read("./2.input").split("\n")
count = 0
input.each do |i| 
    policy = i.split[0]
    policy_min = policy.split('-')[0].to_i
    policy_max = policy.split('-')[1].to_i
    letter = i.split[1].split(':')[0]
    password = i.split[2]

    if (password[policy_min-1] == "#{letter}" )^ (password[policy_max-1] == "#{letter}")
        puts input
        count = count + 1
    end 
    puts "--------------"

end
puts count
