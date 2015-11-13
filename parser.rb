#!/usr/bin/env ruby

require_relative './lib/arena_flowers'

unless ARGV.length == 1
  puts "Syntax:  ./parser.rb <log_file>"
  exit 1
end

logfile = ARGV[0]

page_hits = File.readlines(logfile).map { |line| line.split(' ') }
parser = ArenaFlowers::LogParser.new(page_hits)

puts "\nMost visited pages:\n\n"

ArenaFlowers::PageViewPresenter.new(parser.page_views).sort.to_h.each do |url, views|
  puts "#{url.ljust(20)}\t#{views} visits"
end

puts "\nPages with the most unique page views:\n\n"

max_unique_page_views = parser.unique_page_views.map do |url, ip_list|
  [url, ip_list.sort_by { |ip, hits| hits }.reverse.first.last ]
end.to_h

ArenaFlowers::PageViewPresenter.new(max_unique_page_views).sort.to_h.each do |url, views|
  puts "#{url.ljust(20)}\t#{views} unique views"
end
