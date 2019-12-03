

# modules = [109506,140405]
modules = [109506,140405,139135,110950,84296,123991,59438,85647,81214,100517,100910,57704,83368,50777,85523,95788,127699,138908,95502,81703,67317,108468,58394,72202,121580,86908,72705,86578,83714,114900,142915,51332,69054,97039,143539,61143,113534,98335,58533,83893,127138,50844,88397,133591,83563,52435,96342,109491,81148,127397,86200,92418,144842,120142,97531,54449,91004,129115,142487,68513,140405,80111,139359,57486,116973,135102,59737,144040,95483,134470,60473,113142,78189,53845,124139,78055,63791,99879,58630,111233,80544,76932,79644,116247,54646,85217,110795,142095,74492,93318,122300,82755,147407,98697,98105,132055,67856,109731,75747,135700]
# modules = [14,1969]
@fuel = 0 
def calculate_solid(mass)
    (mass / 3.0).floor - 2
end

def calculate_liquid(mass)
    liquid = (mass / 3.0).floor - 2
    return @fuel if liquid < 0
    puts "adding #{liquid}"
    @fuel = @fuel + liquid
    calculate_liquid(liquid) 
end

@total_modules = 0
@total_fuel = 0
modules.each do |m|
    puts "Module #{m} requires #{calculate_solid(m)} fuel"
    @total_fuel += calculate_liquid(m)
    @total_modules += m
    @fuel = 0
end
puts "Total fuel is #{@total_fuel}"
puts "Total modules is #{@total_modules}"
puts "Total everything is #{@total_modules + @total_fuel}"