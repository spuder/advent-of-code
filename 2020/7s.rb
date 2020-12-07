#!/usr/bin/env ruby

# Input
# ["light red bags contain 1 bright white bag, 2 muted yellow bags", 
# "\ndark orange bags contain 3 bright white bags, 4 muted yellow bags", 
# "\nbright white bags contain 1 shiny gold bag", 
# "\nmuted yellow bags contain 2 shiny gold bags, 9 faded blue bags", 
# "\nshiny gold bags contain 1 dark olive bag, 2 vibrant plum bags", 
# "\ndark olive bags contain 3 faded blue bags, 4 dotted black bags", 
# "\nvibrant plum bags contain 5 faded blue bags, 6 dotted black bags", 
# "\nfaded blue bags contain no other bags", 
# "\ndotted black bags contain no other bags"]

# Output
# light red -> [ { bright white: 1, muted yellow: 2} ]
# dark orange -> [ {bright white: 3, muted yellow: 4} ]
input = File.read("#{__dir__}/7.sample").split('.')
input.map! do |rule| 
    key=rule.split('contain')[0].gsub('bags','').strip
    value = rule.split('contain')[1].strip
    value = value.split(',').map do|rule| 
        rule.split().reject do |v| 
            v == "bag" || v == "no" || v == "other" || v == "bags"
        end.rotate(1)
    end
    value = value.map{|x|{"#{x[0]} #{x[1]}" => x[2]}.compact }
    {key => value}
end
puts input