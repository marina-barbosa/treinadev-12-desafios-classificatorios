require_relative 'binary_converter'

class FileCalculator
  def convert(file_path)
    bi_convert = BinaryConverter.new()

    array = []
    num = 0
    soma = 0
    conteudo = ''
    File.open(file_path, 'r') do |file|
      conteudo << file.read()
      # array << file.readline()[2]
      # file.readchar()
    end

    array = conteudo.split

    for item in array do
      if binario_invalido(item) 
        next        
      end
      num = bi_convert.to_integer(item)      
      soma += num
    end

    return soma
  end
end


def binario_invalido(string)
  for l in string.chars do    
    if l != '0' && l != '1'
      return true
    end
  end
  return false
end