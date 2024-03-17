class RollingStone
  def movement(map, position, movement_list)
    
    moves = movement_list.chars
    linhas = map.length
    colunas = map[0].length
  
    moves.each do |m|
      if m == 'E'
        (position[1].downto(0)).each do |i|        
          if map[position[0]][i] == 'X'
             break
          end
          position[1] = i
         end
      elsif m == 'D'
        (position[1]...colunas).each do |i|        
          if map[position[0]][i] == 'X'
             break
          end
          position[1] = i
         end
      elsif m == 'C'
        (position[0].downto(0)).each do |i|        
          if map[i][position[1]] == 'X'
             break
          end
          position[0] = i
         end
      else # m == 'B'
        (position[0]...linhas).each do |i|        
          if map[i][position[1]] == 'X'
             break
          end
          position[0] = i
         end
      end 
    end
    position
  end
end