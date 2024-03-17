require_relative 'lib/word.rb'

insta = Word.new()

# insta.test('alo amor, to te ligando de um orelhao')

def test(phrase)
    puts 'array1'
    array = phrase.split()
    for p in array do
      puts p
    end
    puts 'array2'
    array2 = array.sort
    for p in array2 do
      puts p
    end
    puts 'array3'
    array3 = array.reverse  
    for p in array3 do
      puts p
    end
end

test('alo amor, to te ligando de um orelhao')

