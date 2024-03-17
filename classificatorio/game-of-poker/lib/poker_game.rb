
class PokerGame
  def initialize(hands)
    @hands = hands
    @cartas_ordenadas = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
    @hash_hands_ord = Hash.new(0)
  end

  def play
    # FORMAT AS INFO
    hash_hands = Hash.new(0)
    @hands.split.each_slice(2) do |name, hand|
      name = name.chomp(':')
      hash_hands[name] = hand
    end

    
    hash_hands.each do |player, hand| 
      @hash_hands_ord[player] = []     
      hand.chars.each_with_index do |c, i|
        if c != 'E' && c != 'P' && c != 'O' && c != 'C' && c != '0'
          if c == '1'
            @hash_hands_ord[player] << "#{c}#{hand[i+1]}#{hand[i+2]}"          
          else
            @hash_hands_ord[player] << "#{c}#{hand[i+1]}"  
          end        
        end
      end
    end    
    
    def par(hand)
      game = Marshal.load(Marshal.dump(hand))
      game.each do |item|
        item[-1] = ''
      end
  
      game.each do |c|
        if game.count(c) == 2 
          return true
        end
      end
      false
    end
  
    def pares(hand)
      game = Marshal.load(Marshal.dump(hand))
      game.each do |item|
        item[-1] = ''
      end
      aux = ''
      contador = 0
      game.each do |c|
        if c != aux
          if game.count(c) == 2
            aux = c 
            contador += 1
          end
        end  
      end
      if contador > 1
        true
      else
        false
      end
      
    end
  
    def trio(hand)
      game = Marshal.load(Marshal.dump(hand))
      game.each do |item|
        item[-1] = ''
      end
  
      game.each do |c|
        if game.count(c) == 3 
          return true
        end
      end
      false
    end
  
    def sequencia(hand) 
      game = Marshal.load(Marshal.dump(hand))
      game.each do |item|
        item[-1] = '' 
      end 
      
      game = game.map { |c| @cartas_ordenadas.index(c) }      
      game = game.sort

      
      (game.size - 1).times.all? { |i| game[i] + 1 == game[i + 1] } 
    end
  
    def flush(hand)
      game = Marshal.load(Marshal.dump(hand)) 
      game = game.map { |c| c[-1] }
      naipe = game[0]
      game.all? { |n| n == naipe }    
    end
  
    def fullhouse(hand)
      game = Marshal.load(Marshal.dump(hand))
      game.each do |item|
        item[-1] = '' 
      end
    
      game.each do |c|
        if game.count(c) == 3 
          game.each do |c|
            if game.count(c) == 2 
              return true
            end
          end      
        end
      end
      false
    end
    
    def quadra(hand)
      game = Marshal.load(Marshal.dump(hand))
      game.each do |item|
        item[-1] = ''
      end

  
      game.each do |c|
        if game.count(c) == 4 
          return true
        end
      end
      false
    end
    
    def sequencia_de_mesmo_naipe(hand) 
      game = hand.clone    
      if sequencia(game) && flush(game)
        return true
      else
        return false
      end
    end    

    resultado = []
    
    @hash_hands_ord.each_key do |key_jogador| 

      hand = @hash_hands_ord[key_jogador] 
      
      if sequencia_de_mesmo_naipe(hand)
        resultado << "#{key_jogador}: Sequência de mesmo naipe"        
      elsif quadra(hand)
        resultado << "#{key_jogador}: Quadra"
      elsif fullhouse(hand)
        resultado << "#{key_jogador}: Fullhouse"
      elsif flush(hand)
        resultado << "#{key_jogador}: Flush"
      elsif sequencia(hand)
        resultado << "#{key_jogador}: Sequência"
      elsif trio(hand)
        resultado << "#{key_jogador}: Trio"
      elsif pares(hand)
        resultado << "#{key_jogador}: Dois Pares"
      elsif par(hand)
        resultado << "#{key_jogador}: Par"
      else
        resultado << "#{key_jogador}: Carta"
      end

    end
    
    games = ['Sequência de mesmo naipe', 'Quadra', 'Fullhouse', 'Flush', 'Sequência', 'Trio', 'Dois Pares', 'Par', 'Carta']
    resultado_ord = []
    games.each do |mao|
      resultado.each do |jogador|
        resultado_ord << jogador if jogador.split(':')[1] == " #{mao}"
      end
    end
    resultado_ord

  end  
end

hands = <<~POKERGAMES
  Erika: AE7E10E9EJE
  Otávio: 5P3E5EQC5C
  Cláudia: KE2E10C2PAC
  Gabriel: 3CKOKC3OJC
  André: 2CKPAPQE10E
POKERGAMES

puts PokerGame.new(hands).play 




