require "byebug"

class Game

    # words = File.readlines("dictionary.txt")
    def initialize
        words = File.readlines("dict.txt").map(&:chomp)
        @dictionary = Set.new(words)
        debugger
    end

end