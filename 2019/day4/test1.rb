#!/usr/bin/env ruby
d = ['1','1','1','2','2']

digit_breakdown = []
x = 1
d.each_with_index do |num, i|
    if d[i] == d[i+1]
        x = x + 1
    else
        digit_breakdown << x
        x = 1
    end
end
puts digit_breakdown.to_s