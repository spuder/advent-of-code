
matches = 0

low = 265275
high = 781584

low.upto(high) do |n|

    # contains 2 numbers that are the same
    d = n.to_s.split('')
    if d.uniq.count < 6 && d.sort == d
        matches += 1
        puts d.join(',').gsub(',','')
    end
end

puts "There are #{matches} matches"