def busiest_servers(k, arrival, load)
  server_load = Array.new(k, 0)
  available = (0...k).to_a  # Array of available servers
  busy = []  # Min heap sorted by end time

  arrival.each_with_index do |time, i|
    # Free up servers that have completed their tasks
    while busy.any? && busy.first[0] <= time
      _, server = busy.shift
      # Insert server back into available array maintaining sorted order
      insert_idx = available.bsearch_index { |x| x >= server } || available.size
      available.insert(insert_idx, server)
    end

    next if available.empty?

    # Find the next available server
    target = i % k
    idx = available.bsearch_index { |x| x >= target }
    idx ||= 0  # Wrap around to the beginning if no server found
    server = available.delete_at(idx)

    # Assign the request to the available server
    server_load[server] += 1
    
    # Add to busy servers (maintain sorted order by insertion)
    end_time = time + load[i]
    insert_idx = busy.bsearch_index { |x| x[0] > end_time } || busy.size
    busy.insert(insert_idx, [end_time, server])
  end

  max_load = server_load.max
  (0...k).select { |i| server_load[i] == max_load }
end

# Input: k = 3, arrival = [1,2,3,4,5], load = [5,2,3,3,3] 
k = 3
arrival = [1,2,3,4,5]
load = [5,2,3,3,3] 
# Output: [1] 
# Explanation: 
# All of the servers start out available.
# The first 3 requests are handled by the first 3 servers in order.
# Request 3 comes in. Server 0 is busy, so it's assigned to the next available server, which is 1.
# Request 4 comes in. It cannot be handled since all servers are busy, so it is dropped.
# Servers 0 and 2 handled one request each, while server 1 handled two requests. Hence server 1 is the busiest server.

p busiest_servers(k, arrival, load)
