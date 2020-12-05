#!/usr/bin/env ruby

# https://adventofcode.com/2020/day/4

# Open file
# Create object with each passport, split on empty line
input = []
input = File.read("./4.input").split(/^\s*$/)
# puts passports[0]
# Split each ':' into hash values
passports = [ ]
input.each do |passport| 
    #TODO: validate data has no dupliate keys
    passports << passport.split(' '). map{|s| s.split(':').flatten }.to_h
    # puts '----'
    # puts data
end
# Look at every passport and check if required fields are present
required_feilds=['byr','iyr','eyr','hgt','hcl','ecl','pid']
optional_fields = [ 'cid' ]

valid_passports = 0
passports.each do |passport|
    valid = true
    required_feilds.each do |field| 
        valid = false unless passport.has_key?(field)
    end
    valid_passports = valid_passports + 1 if valid == true
end

puts valid_passports

#237