#!/usr/bin/env ruby

puzzel_input=%w(199
200
208
210
200
207
240
269
260
263).map! {|x| x.to_i}

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
        if previous_measurement
            increments += 1
        end
        puts "#{window.sum} "
        previous_measurement = depth_measurement
    end
end

puts increments

