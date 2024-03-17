require_relative 'participant'
class JuninhoExam
  attr_reader :map, :participants
  def initialize(map:, participants:)
    @map = map
    @participants = participants
  end


  def winner
    exame_on = true
    winners = []
    champ = ''
    backward = []
    
    @participants.each do |grupo|
      backward << grupo.starting_position
    end    


    while exame_on do

      @participants.each_with_index do |grupo, index|
        grupo.movement_speed.times do
          
          l, c = grupo.starting_position
          esquerda = @map[l][c-1] if c > 0
          direita = @map[l][c+1] if c < @map[l].length - 1
          cima = @map[l-1][c] if l > 0
          baixo = @map[l+1][c] if l < @map.length - 1         
          
          if (esquerda == '*' || esquerda == '!') && [l, c-1] != backward[index]                     
            backward[index] = grupo.starting_position
            grupo.starting_position = [l, c-1]
          elsif (direita == '*' || direita == '!') && [l, c+1] != backward[index]
            backward[index] = grupo.starting_position
            grupo.starting_position = [l, c+1]
          elsif (cima == '*' || cima == '!') && [l-1, c] != backward[index]
            backward[index] = grupo.starting_position
            grupo.starting_position = [l-1, c]
          else (baixo == '*' || baixo == '!') && [l+1, c] != backward[index]
            backward[index] = grupo.starting_position
            grupo.starting_position = [l+1, c]
          end  
        
        end
      end

      
    
      @participants.each_with_index do |grupo, index|
        l, c = grupo.starting_position
        if @map[l][c] == '!' 
          winners << grupo 
          exame_on = false
        end        
      end      
      

      hash_winners = Hash.new(0) 
      if winners.length > 1

        winners.each do |grupo|
          hash_winners[grupo.team] += grupo.strength
        end

        hash_winners = hash_winners.sort_by { |grupo, strength| strength }.reverse
        champ = hash_winners[0]
        return champ[0]
      end


    end

    winners[0].team
  end
end
