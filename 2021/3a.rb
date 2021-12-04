#!/usr/bin/env ruby

input = File.readlines('3.txt').map { |x| x.chomp.chars}
@binary_length=input[0].length
@binary_length= @binary_length-1
puts @binary_length

def get_gamma(input)
    answer=[]
    zeros=0
    ones=0
    0.upto(@binary_length) do |x|
        input.each do |line|
            if line[x]=='0'
                zeros+=1
            elsif line[x]=='1'
                ones+=1
            end
        end
        if zeros>ones
            answer.push('0')
        else
            answer.push('1')
        end
        zeros=0
        ones=0
    end
    return answer
end

def get_epsilon(input)
    answer=[]
    zeros=0
    ones=0
    0.upto(@binary_length) do |x|
        input.each do |line|
            if line[x]=='0'
                zeros+=1
            elsif line[x]=='1'
                ones+=1
            end
        end
        if zeros<ones
            answer.push('0')
        else
            answer.push('1')
        end
        zeros=0
        ones=0
    end
    return answer
end


gamma_rate = get_gamma(input)
puts "#{gamma_rate.join}: (#{gamma_rate.join.to_i(2)})"
epsilon_rate = get_epsilon(input)
puts "#{epsilon_rate.join}: (#{epsilon_rate.join.to_i(2)})"
power_consumption = gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)
puts "Total: #{power_consumption}"