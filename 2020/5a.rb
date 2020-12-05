#!/usr/bin/env ruby

# https://adventofcode.com/2020/day/5

seats_rows = [*0..127]
seats_columns = [*0..7]
max_seat=0
input = []
File.readlines("./5.input").each do |line|
    puts line
    input << line.strip
end

input.each do |i| 
    rows=i[0..6]
    columns=i[7..10]
    seats_rows = [*0..127]
    seats_columns = [*0..7]
    rows.split('').each do |row|
        left,right = seats_rows.each_slice( (seats_rows.size/2.0).round ).to_a
        seats_rows = left if row == 'F'
        seats_rows = right  if row == 'B'
    end
    columns.split('').each do |column|
        left,right = seats_columns.each_slice( (seats_columns.size/2.0).round ).to_a
        seats_columns = left if column == 'L'
        seats_columns = right  if column == 'R'
    end
    puts seats_rows
    puts seats_columns
    seat = seats_rows[0] * 8 + seats_columns[0]
    puts seat
    max_seat = seat if seat > max_seat
end
puts "max_seat: #{max_seat}"

# 933