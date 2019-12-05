
matches = 0

low = 265275
high = 781584

low.upto(high) do |n|

    d = n.to_s.split('')
    # Has atleast 1 matching pair of numbers
    if d.uniq.count < 6
        # All numbers are in assending order
        if d.sort == d
            # Has 2 matching neighboring array elments
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
            if digit_breakdown.include?(2)
                puts d.join(',').gsub(',','')
                matches += 1
            end
        end
    end
end

puts "There are #{matches} matches"