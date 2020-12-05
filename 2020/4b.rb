#!/usr/bin/env ruby
require 'colorize'
# https://adventofcode.com/2020/day/4

def valid_byr(x)
    valid = x.to_s.length == 4 && x.to_i >= 1920 && x.to_i <= 2002
    puts "byr => #{x}: #{valid}"
    return valid
end

def valid_iyr(x)
    valid = x.to_s.length == 4 && x.to_i >= 2010 && x.to_i <= 2020
    puts "iyr => #{x}: #{valid}"
    return valid
end

def valid_eyr(x)
    valid = x.to_s.length == 4 && x.to_i >= 2020 && x.to_i <= 2030
    puts "eyr => #{x}: #{valid}"
    return valid
end

def valid_hgt(x)
    valid = true
    valid = false unless x.to_s.match?(/\d.*(cm|in)/i)
    #TODO: make resilent against string containg both 'in' and 'cm'
    case 
    when x.to_s.include?("cm")
        h = x.split('cm')[0].to_i
        valid = false unless h >=150 && h <=193
    when x.to_s.include?("in")
        h = x.split('cm')[0].to_i
        valid = false unless h >=59 && h <=76
    else
        valid = false
    end
    puts "hgt => #{x}: #{valid}"
    return valid
end

def valid_hcl(x)
    valid = true
    valid = false unless x.to_s.match(/^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/)
    puts "hcl => #{x}: #{valid}"
    return valid
end

def valid_ecl(x)
    valid = true
    valid = false unless %w(amb blu brn gry grn hzl oth).include?(x)
    puts "ecl => #{x}: #{valid}"
    return valid
end

def valid_pid(x)
    valid = true
    valid = false unless x.to_s.match(/^([0-9]{9})$/)
    puts "pid => #{x}: #{valid}"
    return valid
end

def valid_cid(x)
    return true
end


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
# validation_checks = ['valid_byr','valid_iyr', 'valid_eyr', 'valid_hgt','valid_hcl','valid_ecl','valid_pid', 'valid_cid']
valid_passports = 0
passports.each do |passport|
    valid = true
    required_feilds.each do |field| 
        unless passport.has_key?(field)
            valid = false 
            next
        end
    end
    valid = false unless valid_byr(passport['byr'])
    valid = false unless valid_iyr(passport['iyr'])
    valid = false unless valid_eyr(passport['eyr'])
    valid = false unless valid_hgt(passport['hgt'])
    valid = false unless valid_hcl(passport['hcl'])
    valid = false unless valid_ecl(passport['ecl'])
    valid = false unless valid_pid(passport['pid'])
    valid = false unless valid_cid(passport['cid'])
    puts "-----------------------------------------".green if valid == true
    puts "-----------------------------------------".red if valid == false

    valid_passports = valid_passports + 1 if valid == true
end

puts "Valid: #{valid_passports}, Total: #{passports.count}"

#150 (too low, but is the answer for someone else)

