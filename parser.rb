#!/usr/bin/env ruby

unless ARGV.length == 1
  puts "Syntax:  ./parser.rb <log_file>"
  exit 1
end

logfile = ARGV[0]

page_hits = File.readlines(logfile).map { |line| line.split(' ') }

#most page views
#most unique page views

page_views = {}
unique_page_views = {}

page_hits.each do |hit|
  url, source_ip = hit

  page_views[url] = page_views.fetch(url, 0) + 1

  unique_page_views[url] ||= {}
  unique_page_views[url][source_ip] = unique_page_views[url].fetch(source_ip, 0) + 1
end

sorted_page_views = page_views.sort_by { |k, v| v }.reverse.to_h

max_unique_page_views = unique_page_views.map do |url, ip_list|
  [url, ip_list.sort_by { |ip, hits| hits }.reverse.first.last ]
end

sorted_unique_views =  max_unique_page_views.sort_by { |k, v| v }.reverse.to_h

puts "\nMost visited pages:\n\n"
sorted_page_views.each { |url, views| puts "#{url.ljust(20)}\t#{views} visits" }

puts "\nPages with the most unique page views:\n\n"
sorted_unique_views.each { |url, views| puts "#{url.ljust(20)}\t#{views} unique views" }
