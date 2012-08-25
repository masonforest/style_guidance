module StyleGuidance
  class Shell
    def self.ask(message)
      say(message)
      STDIN.getch
    end

    def self.say(message)
      puts message
      puts
    end
  end
end
