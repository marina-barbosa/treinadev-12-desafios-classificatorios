class MinMax
  def find(values) 
    array = values.split
    numeros = [];
    palavras = [];  
  
    for item in array do
      if item.to_i != 0 
        numeros << item.to_i
      else
        palavras << item
      end
    end 

    if palavras.length == 0
      numeros = numeros.minmax
      return "Mínimo: #{numeros[0]}; Máximo: #{numeros[1]}"
    end

    palavras = palavras.sort.reverse

    palavraMenor = menorLength(palavras)
    palavraMaior = maiorLength(palavras)

    if numeros.length == 0
      return "Mínimo: #{palavraMenor}; Máximo: #{palavraMaior}"
    end
  
    numMenor = numeros.min
    numMaior = numeros.max    
  
  
    menor = numMenor
    maior = numMaior
  
    if numMenor == palavraMenor.length
      if temLetraRepetida(palavraMenor)
        menor = palavraMenor  
      end
    elsif palavraMenor.length < numMenor
      menor = palavraMenor
    end
  
    if numMaior == palavraMaior.length
      if temLetraRepetida(palavraMaior)
        maior = palavraMaior
      end
    elsif palavraMaior.length > numMaior
      maior = palavraMaior  
    end
  
    return "Mínimo: #{menor}; Máximo: #{maior}"
  end
  
  def menorLength(array)
    menorPalavra = array[0]
    for p in array do
      if p.length < menorPalavra.length
        menorPalavra = p
      end
    end
    menorPalavra
  end
  
  def maiorLength(array)
    maiorPalavra = array[0]
    for p in array do
      if p.length > maiorPalavra.length
        maiorPalavra = p
      end
    end
    maiorPalavra
  end
  
  def temLetraRepetida(palavra)
    for l in palavra.chars do
      resultado = palavra.chars.select { |char| char == l }      
      if resultado.length > 1
        return true
      end      
    end
    return false
  end 
end
