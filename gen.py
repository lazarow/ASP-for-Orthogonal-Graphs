import random

num_nodes = 12
grid_width = 8
grid_height = 4
edge_prob = 0.3

nodes = f"v(0..{num_nodes - 1}).\n"
grids = f"\nx(0..{grid_width - 1}).\ny(0..{grid_height - 1})."
nof_edges = [0 for i in range(num_nodes)]

edges = []
for i in range(num_nodes):
  for j in range(i+1, num_nodes):
    if nof_edges[i] == 4 or nof_edges[j] == 4:
        continue
    if random.random() < edge_prob:
      edges.append(f"e({i},{j}).")
      nof_edges[i] += 1
      nof_edges[j] += 1

gml_string = nodes + "\n".join(edges) + grids

print(gml_string)
