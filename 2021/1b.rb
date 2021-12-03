#!/usr/bin/env ruby

puzzel_input=File.read('1a.txt').split("\n").map(&:to_i)


# measurement_increase=0

# window=[]
# total=0
# increases=0
# puzzel_input.each_with_index do |x,i|
#     window << x
#     if window.length > 3
#         window.delete_at 0 
#     end
#     if window.length == 3
#         if window.sum > total 
#                 puts "#{total} (increased) | #{window} #{window.sum} "
#                 total = window.sum 
#                 increases += 1 
#         elsif window.sum < total
#             puts "#{total} (decreased) | #{window} #{window.sum} "
#         else
#             puts "#{total} (no change) | #{window} #{window.sum} "
#         end
#     else
#         puts "broke"
#     end
# end

# Count number of times depth measurment increases
previous_measurement = nil
depth_measurement = 0
increments = 0 
window=Array.new
puzzel_input.each_with_index do |x,i|
    window << x
    if window.length > 3
        window.delete_at 0 
    end
    if window.length == 3
        depth_measurement = window.sum
        if previous_measurement && previous_measurement < depth_measurement
            increments += 1
        end
        puts "#{window.sum} "
        previous_measurement = depth_measurement
    end
end

puts "There were #{increments} increments"

# 1997 is too high
# 811 is too low
# 1130 is correct