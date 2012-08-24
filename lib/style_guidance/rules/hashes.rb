module StyleGuidance
  module Rules
    class Hashes
      include StyleGuidance::Rule
      DESCRIPTION = "Replaces ruby 1.8 hashes with ruby 1.9 hashes"

      def initialize
        @yes_to_all = false
      end

      def apply
        puts "applying hashes"
        files.each do |file|
          source=IO.read(file)
          changed = false
          lines = source.lines.with_index(1).map do |line,line_number|
            line.gsub(/(([^\w^:]):([\w\d_]+)\s*=>)/) do |match|
              key = $2 + $3
              if @yes_to_all
                changed = true
                puts "Replaced #{file}:#{line_number.to_s}:" + line.gsub(match,"\e[32m#{match}\e[0m")
                key+":"
              else
                puts "Replace ruby 1.8 hash style?"

                # Print with the key colorized
                puts "#{file}:#{line_number.to_s}:"+line.gsub(match,"\e[32m#{match}\e[0m")
                puts "(\e[32mynaq\e[0m) y=yes n=no  a=yes to all q=quit" 

                choice = STDIN.getch
                puts
                case choice
                when "y"
                  changed = true
                  key+":"
                when "n"
                  key
                when "a"
                  @yes_to_all = true
                when "q"
                  exit
                else
                  puts "Unrecognized Option: Try y=yes n=no q=quit"
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
  end
end
