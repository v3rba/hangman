require 'unicode_utils/upcase'

require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_reader'

VERSION = 'Игра виселица, версия 5. (c) Хороший программист'.freeze

word_reader = WordReader.new
words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"
word = word_reader.read_from_file(words_file_name)

game = Game.new(word)
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
