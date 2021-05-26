require 'pry'

text = File.read('sample_text.txt')

def longest_sentence(text)
  sentences = text.split(/\.|\?|!/)
  longest = sentences.max_by { |sentence| sentence.split.size}.strip!
  words = longest.split.size

  puts "#{longest}"
  puts "#{words} words long"
end

longest_sentence(text)