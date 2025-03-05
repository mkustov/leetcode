require 'pry'
# @param {Integer} k
# @param {Integer[]} arrival
# @param {Integer[]} load
# @return {Integer[]}
def busiest_servers(k, arrival, load)
  server_load = {}
  current_load = {}
  max_tasks = 0
  k.times do |i| 
    server_load[i] = 0
    current_load[i] = 0
  end
  
  servers = Array.new(k) { |s| s }

  arrival.each_with_index do |arrival_time, i|
    p "*********ARRIVAL #{arrival_time}, LOAD #{load[i]}*********"
    p servers: servers
    server_to_pick_request = i % k
    p server_to_pick_request: server_to_pick_request

    available_server = nil
    # if current_load[server_to_pick_request] > arrival_time
    #   server_to_pick_request += 1
    #   if server_to_pick_request == k
    #     server_to_pick_request = 0
    #   end
    #   while server_to_pick_request != i % k 
    #     if current_load[server_to_pick_request] <= arrival_time
    #       available_server = server_to_pick_request
    #       break
    #     end
    #     server_to_pick_request += 1
    #     if server_to_pick_request == k
    #       server_to_pick_request = 0
    #     end
    #   end
    # else
    #   available_server = server_to_pick_request
    # end

    cond = proc { |j| current_load[j] <= arrival_time }
    available_server = (i % k...k).find(&cond) || (0...i % k).find(&cond)
    next unless available_server

    if available_server && current_load[available_server] <= arrival_time
      current_load[available_server] = arrival_time + load[i]
      server_load[available_server] += 1
    end
    max_tasks = server_load[available_server] if server_load[available_server] > max_tasks


    p current_load: current_load
    p server_load: server_load

    # p '-----'
    # p current_load: current_load
    # current_load.keys.each do |server|
    #   p server: server
    #   p current_load_server_before: current_load[server]
    #   if current_load[server] <= arrival_time
    #     servers << server unless servers.include?(server)
    #   end
    #   p current_load_server_after: current_load[server]
    # end
  end

  # grouped_by_processed_load = server_load.group_by { |k, v| v }
  # max_requests = grouped_by_processed_load.keys.max
  # grouped_by_processed_load[max_requests].map(&:first)

  (0...k).select { |i| server_load[i] == max_tasks }
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
