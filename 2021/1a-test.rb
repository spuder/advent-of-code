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

measurement_increase=0

# Loop over the input with itterator
puzzel_input.each_with_index do |x,i|
    if i > 0
        if x > puzzel_input[i-1]
            measurement_increase = measurement_increase + 1
        end
    end
end

puts measurement_increase