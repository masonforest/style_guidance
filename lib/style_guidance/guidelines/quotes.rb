module StyleGuidance
  module Guidelines
    class Quotes
      include StyleGuidance::Guideline
      include StyleGuidance
      DESCRIPTION = "Replace double quoted strings with single quoted strings unless the string is interpolated"
      QUESTION =  "Replace double quotes with single quotes on non interpolated string?"
      DOUBLE_QUOTED_STRING_SEARCH = /("[^"\\]*(\\.[^"\\]*)*")/

      def initialize
        @yes_to_all = false
        @changed = false
      end

      def apply
        files.each do |file|
          @file = file
          @source = IO.read(file)
          lines = @source.lines.with_index(1).map do |line,line_number|
            @line = line
            @line_number = line_number
            apply_to_line
          end
          @source = lines.join
        if @changed
          IO.write(file, @source)
        end
       end
      end

      private

      def apply_to_line
        @line.gsub(DOUBLE_QUOTED_STRING_SEARCH) do |string|
          # Skip interpolated strings
          return string if string =~ /\#{/
          @string = string
          if @yes_to_all
            @changed = true
            puts replaced_message
            single_quoted_string
          else

            message_options = 
            choice = Shell.ask(question)

            case choice
            when "y"
              @changed = true

              single_quoted_string
            when "n"
              string
            when "a"
              @yes_to_all = true
              single_quoted_string
            when "q"
              exit
            else
              puts "Unrecognized Option: Try y=yes n=no q=quit"
            end
          end
        end
      end
      def question
        [ QUESTION, line_message, options_message ].join("\n")
      end
      def single_quoted_string
        "'#{@string[1..-2]}'"
      end

      def replaced_message
        "Replaced #{@file}:#{@line_number.to_s}:" +
          @line.gsub(@string,"\e[32m#{@string}\e[0m")
      end

      def options_message
        "(\e[32mynaq\e[0m) y=yes n=no  a=yes to all q=quit"
      end

      def line_message
        "#{@file}:#{@line_number.to_s}:" + highlighed_replacement
      end

      def highlighed_replacement
        @line.chomp.gsub(@string, "\e[32m#{@string}\e[0m")
      end
    end
  end
end

