input = []
File.readlines("./2020/3.input").each do |line|
    input << line.strip.split(//)
end

# puts input[0].join
column_index=0
row_index=0
slope=[3,1]

trees = 0

0.upto(input.length - 1) do | row|
  if input[row][column_index] == '.'
    input[row][column_index] = 'O'
  elsif input[row][column_index] == '#'
      input[row][column_index] = 'X'
      trees = trees +1
  else
    raise "invalid value '#{input[row][column_index]}'"
    # break
  end 
  column_index = column_index + slope[0]
  column_index = column_index - 31 if column_index >= 31
end


puts "==============="
puts input.join

puts "trees = #{trees}"