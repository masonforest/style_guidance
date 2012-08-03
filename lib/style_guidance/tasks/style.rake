require 'io/console'

namespace :style do
    desc "Replaces double quoted strings with single quoted strings unless the string is interpolated"
    task :quotes do
      change_all = false
      Dir["**/*"].each do |file|
        if ["rb"].include?(File.extname(file)[1..-1])
          source=IO.read(file)
          changed = false
          lines = source.lines.with_index(1).map do |line,line_number|
            line.gsub(/("[^"\\]*(\\.[^"\\]*)*")/) do |string|
              # Skip interpolated strings
              next string if string =~ /\#{/
              if change_all
                changed = true
                puts "Replaced #{file}:#{line_number.to_s}:" + line.gsub(string,"\e[32m#{string}\e[0m")
                "'#{string[1..-2]}'"
              else
                puts "Replace double quotes with single quotes on non interpolated string?"

                # Print with the string colorized
                puts "#{file}:#{line_number.to_s}:"+line.gsub(string,"\e[32m#{string}\e[0m")
                puts "(\e[32mynaq\e[0m) y=yes n=no  a=yes to all q=quit" 

                choice = STDIN.getch
                puts
                case choice
                when "y"
                  changed = true

                  "'#{string[1..-2]}'"
                when "n"
                  string
                when "a"
                  change_all = true
                when "q"
                  exit
                else
                  puts "Unrecognized Option: Try y=yes n=no q=quit"
                end
              end
            end
          end
        end
        if changed
          IO.write(file, lines.join)
        end
    end
  end
end
task :style => ["style:quotes"] 
