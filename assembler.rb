#!/usr/bin/env ruby

# usage: ./assembler <skeleton >Dockerfile

ARGF.each do |line|
    if (matches = line.match("^(with\\-\\S+)"))
      filename= matches[0]
      puts "# #{filename}"
      File.readlines("#{File.dirname(__FILE__)}/mixins/#{filename}.docker").each {|subline| puts subline}
      puts
    else
      puts line
    end
end

