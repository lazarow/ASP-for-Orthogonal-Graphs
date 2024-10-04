import svgwrite

# Parse the provided input
input_data = """
p_for_v(0,1,1) segment(2,0,2,1) segment(0,1,0,0) segment(4,1,4,0) p_for_v(0,2,0) segment(0,2,0,1) segment(0,2,0,3) segment(4,2,4,1) segment(4,2,4,3) segment(7,2,7,1) segment(7,2,7,3) segment(6,3,6,2) p_for_v(4,2,3) p_for_v(0,3,5) p_for_v(2,0,6) p_for_v(2,1,7) p_for_v(6,3,8) p_for_v(7,2,2) p_for_v(6,2,9) p_for_v(4,1,10) p_for_v(3,1,4) p_for_v(3,3,11) segment(2,0,0,0) segment(2,0,4,0) segment(0,1,2,1) segment(3,1,2,1) segment(3,1,4,1) segment(4,1,7,1) segment(0,2,4,2) segment(4,2,6,2) segment(7,2,6,2) segment(0,3,3,3) segment(6,3,4,3) segment(6,3,7,3)
"""

# Initialize SVG drawing
dwg = svgwrite.Drawing('graph.svg', profile='tiny', size=(400, 400))

# Define scaling factor for grid size
grid_size = 50
circle_radius = 5

# To store vertex positions for drawing circles
vertex_positions = {}

# Function to map coordinates from grid to SVG space
def map_to_svg(x, y):
    # Assuming (0,0) is bottom-left in SVG, but (0,0) is top-left in coordinates
    return (x * grid_size + 50, 350 - y * grid_size)

# Parse the input and draw the graph
for element in input_data.split():
    if element.startswith("segment"):
        # Extract the coordinates of the line
        x1, y1, x2, y2 = map(int, element[8:-1].split(','))
        start = map_to_svg(x1, y1)
        end = map_to_svg(x2, y2)
        
        # Draw line on SVG canvas
        dwg.add(dwg.line(start, end, stroke=svgwrite.rgb(0, 0, 0, '%')))

for element in input_data.split():
    if element.startswith("p_for_v"):
        # Extract the coordinates and vertex id
        x, y, v = map(int, element[8:-1].split(','))
        pos = map_to_svg(x, y)
        
        # Store vertex positions to use later for labeling
        vertex_positions[v] = pos
        
        # Draw a circle for the vertex
        dwg.add(dwg.circle(center=pos, r=circle_radius, fill='white', stroke=svgwrite.rgb(0, 0, 0, '%')))
        
        # Label the vertex with its id
        dwg.add(dwg.text(str(v), insert=(pos[0] - (13 if len(str(v)) == 1 else 21), pos[1] - 9), fill='black'))

# Save the SVG file
dwg.save()

print("SVG file 'graph.svg' has been generated.")