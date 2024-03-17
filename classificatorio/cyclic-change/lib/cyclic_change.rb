class CyclicChange
  def cycle(table, cycles)
    troca = []
    linhas = table.length
    colunas = table[0].length
    (0...cycles).each do |y|
      (0...linhas).each do |l|
        (0...colunas).each do |c| 
          if table[l][c] != '+'
            hifen = 0
            barra = 0
            if l > 0 && c > 0
              #1 --
              hifen += 1 if table[l-1][c-1] == '+' || table[l-1][c-1] == '-'
              barra += 1 if table[l-1][c-1] == '+' || table[l-1][c-1] == '|'
            end
            if l > 0
              #2 -1
              hifen += 1 if table[l-1][c] == '+' || table[l-1][c] == '-'
              barra += 1 if table[l-1][c] == '+' || table[l-1][c] == '|'
            end
            if l > 0 && c < colunas -1
              #3 -+
              hifen += 1 if table[l-1][c+1] == '+' || table[l-1][c+1] == '-'
              barra += 1 if table[l-1][c+1] == '+' || table[l-1][c+1] == '|'
            end
            if c > 0
              #4 1-
              hifen += 1 if table[l][c-1] == '+' || table[l][c-1] == '-'
              barra += 1 if table[l][c-1] == '+' || table[l][c-1] == '|'
            end
            if c < colunas -1
              #6 1+
              hifen += 1 if table[l][c+1] == '+' || table[l][c+1] == '-'
              barra += 1 if table[l][c+1] == '+' || table[l][c+1] == '|'
            end
            if l < linhas -1 && c > 0
              #7 +-
              hifen += 1 if table[l+1][c-1] == '+' || table[l+1][c-1] == '-'
              barra += 1 if table[l+1][c-1] == '+' || table[l+1][c-1] == '|'
            end
            if l < linhas -1
              #8+1   
              hifen += 1 if table[l+1][c] == '+' || table[l+1][c] == '-'
              barra += 1 if table[l+1][c] == '+' || table[l+1][c] == '|'
            end
            if l < linhas -1 && c < colunas -1
              #9 ++
              hifen += 1 if table[l+1][c+1] == '+' || table[l+1][c+1] == '-'
              barra += 1 if table[l+1][c+1] == '+' || table[l+1][c+1] == '|'
            end
              
            troca << [l,c] if barra >= 4 && hifen >= 4             
          end
        end
      end      
      troca.each do |item|
        table[item[0]][item[1]] = '+'
      end
    end
    table
  end
end

# -- -1 -+
# 1- 11 1+
# +- +1 ++

