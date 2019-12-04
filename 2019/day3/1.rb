

@grid = Array.new()

def create_grid(x,y)
    dots = x * y
    dots.times do 
        @grid << '.'
    end
end

def draw_grid(x,y)
    dots = x * y
    @grid.each_with_index do |g,i|
        puts "\n" if i > 0 && i % x == 0
        print "#{g}"
    end
end

def set_origin(x,y, width)
    index = (width * y + x)
    @grid[index] = 'o'
end

def draw_wire(wire, origin_x, origin_y, width)
    start_position = (width * origin_y + origin_x)
    wire.each do |w|
        case w[0]
        when 'R'
            fin = start_position + w[1].to_i
            start_position.upto(fin) do |x|
                @grid[x] = '-'
                @grid[x] = 'o' if x == (width * origin_y + origin_x)
                @grid[x] = '+' if x == fin
            end
            start_position = fin
        when 'U'
            fin = start_position - ( w[1].to_i * width )
            wires = []
            position = start_position
            while position > fin do
                wires << position
                position = position - width
            end
            wires.each do |x|
                @grid[x] = '|'
                @grid[x] = '+' if x == fin || x == start_position
                @grid[x] = 'o' if x == (width * origin_y + origin_x)
            end
            start_position = fin
        when 'L'
            fin = start_position - w[1].to_i
            start_position.downto(fin) do |x|
                @grid[x] = '-'
                @grid[x] = '+' if x == fin || x = start_position
                @grid[x] = 'o' if x == (width * origin_y + origin_x)
            end
            start_position = fin
        when 'D'
            fin = start_position + ( w[1].to_i * width )
            wires = []
            position = start_position
            while position < fin do
                wires << position
                position = position + width
            end
            wires.each do |x|
                @grid[x] = '|'
                @grid[x] = '+' if x == fin || x == start_position
                @grid[x] = 'o' if x == (width * origin_y + origin_x)
            end
            start_position = fin
        else
            raise 'unsupported direction'
        end
    end
end

# wire1 = %w(R8 U5 L5 D3)
# wire2 = %w(U7 R6 D4 L4)
# width = 11
# height = 10
# origin_x = 1
# origin_y = 8
# create_grid(width, height)
# set_origin(origin_x, origin_y, width)
# draw_wire(wire1, origin_x, origin_y, width)
# draw_wire(wire2, origin_x, origin_y, width)
# draw_grid(width, height)

wire1 = %w(R75 D30 R83 U83 L12 D49 R71 U7 L72)
wire2 = %w(U62 R66 U55 R34 D71 R55 D58 R83)
width = 167
height = 120
origin_x = 100
origin_y = 100
create_grid(width, height)
set_origin(origin_x, origin_y, width)
draw_wire(wire1, origin_x, origin_y, width)
draw_wire(wire2, origin_x, origin_y, width)
draw_grid(width, height)
