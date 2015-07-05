require 'nokogiri'
require 'net/http'

   query        = ARGV[0]
   uri          = URI("http://rosettacode.org/wiki/" + query)
   body         = Net::HTTP.get(uri)
   document     = Nokogiri::HTML(body)
   solutions    = document.css('.ruby')
   simple_ruby_solution = solutions.first.text.split("  ").join("\n")
   final_solution = simple_ruby_solution.gsub!(/end\Z/, " \n end")
   File.write("#{query}.rb", final_solution)
