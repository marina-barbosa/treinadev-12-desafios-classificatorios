class Word
  def longest(phrase)
    array = phrase.split()
    array = array.sort
    array = array.reverse
    maior = phrase[0]
    for p in array do
      if p.length >= maior.length
        maior = p
      end
    end
    return maior
  end

  def shortest(phrase)
    array = phrase.split()
    array = array.sort
    array = array.reverse    
    menor = 'inconclusivo'
    for p in array do
      if p.length < menor.length && p.length > 1
        menor = p
      end
    end
    return menor
  end
end
