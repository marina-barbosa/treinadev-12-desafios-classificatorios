class SecurityControl
  def password_decoder(input_file)
    
    conteudo = '' ## le arquivo e transforma em array
    File.open(input_file, 'r') do |file|
      conteudo = file.read().split("\n")
    end
    

    ## decifra
    decifradas = []
    conteudo.each do |item|
      frase, fator = item.to_s.split
      array = frase.chars.each_slice(fator.to_i).map { |slice| slice.join }

      # em A, verifica se tem B
      # se tiver B, coloca A antes da B
      # se nao tiver B,  coloca A no final
      # busca R, remove ultima R

      senha = array[0].chars
      2.times do
          array.each do |grupo|
              grupo = grupo.chars
              grupo.each_with_index do |l,i|
                  a = l
                  if i != grupo.length - 1
                      b = grupo[i+1]
                      if senha.include?(b)
                          index = senha.index(b)
                          senha.insert(index, a)
                      else
                          senha << a
                      end
                      if senha.count(a) == 2
                          senha.reverse!
                          index = senha.index(a)
                          senha.delete_at(index)
                          senha.reverse!
                      end
                  else
                      senha << a
                      if senha.count(a) == 2
                          senha.reverse!
                          index = senha.index(a)
                          senha.delete_at(index)
                          senha.reverse!
                      end
                  end
              end
          end
      end
      decifradas << senha.join
    end


    ## escreve
    res = decifradas.join("\n")
    File.open('data/result.txt', 'a') do |file|
      file.print res
    end    

  end
end


#SecurityControl.new.password_decoder('data/password_list5.txt')




