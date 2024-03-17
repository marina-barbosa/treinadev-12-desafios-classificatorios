plantation_size = '6x6'
instructions = <<~INSTRUCTIONS
fertilizante/semente {*} [+]
{}:1,0:5x4
*:0,1:6x2
[]:0,2:5x4
+:2,3:4x3
INSTRUCTIONS

class Plantation
  def initialize(instructions, plantation_size)
    @instructions = instructions
    @plantation_size = plantation_size
    @matriz = nil
    @combination = []
  end

  def set_crop()
    size = @plantation_size.split('x')
    @matriz = Array.new(size[0].to_i) { Array.new(size[1].to_i, " ") }    
    arr = @instructions.split()
    org_instructions = []
    arr.each do |item|
      @combination << item if item.length == 3
      org_instructions << item if item.length > 3 && item.length < 11      
    end
    org_instructions.map! do |item|
      item.split(":")
    end
    org_instructions.map! do |item|
      new_item = {}
      new_item[:produto] = item[0]
      new_item[:inicio] = item[1].split(",")
      new_item[:qtdd] = item[2].split("x")
      new_item
    end 
    org_instructions.each do |instrucao|
      linha_inicial = instrucao[:inicio][0].to_i
      coluna_inicial = instrucao[:inicio][1].to_i
      linha_final = linha_inicial + instrucao[:qtdd][0].to_i
      coluna_final = coluna_inicial + instrucao[:qtdd][1].to_i
      for l in linha_inicial..@matriz.length - 1
        for c in coluna_inicial..@matriz.length - 1
          if l >= linha_inicial  && l <= linha_final-1 && c >= coluna_inicial && c <= coluna_final-1
            if @matriz[l][c] == "*" && instrucao[:produto] == '{}'
              @matriz[l][c] = '{*}'
            elsif @matriz[l][c] == "+" && instrucao[:produto] == '{}'
              @matriz[l][c] = '{+}' 
            elsif @matriz[l][c] == "*" && instrucao[:produto] == "[]"
              @matriz[l][c] = "[*]" 
            elsif @matriz[l][c] == "+" && instrucao[:produto] == "[]"
              @matriz[l][c] = "[+]" 

            elsif @matriz[l][c] == '{}' && instrucao[:produto] == "*"
              @matriz[l][c] = '{*}' 
            elsif @matriz[l][c] == '{}' && instrucao[:produto] == "+"
              @matriz[l][c] = '{+}'
            elsif @matriz[l][c] == "[]" && instrucao[:produto] == "*"
              @matriz[l][c] = '[*]'  
            elsif @matriz[l][c] == "[]" && instrucao[:produto] == "+"
              @matriz[l][c] = '[+]' 

            elsif @matriz[l][c] == '{}' && instrucao[:produto] == "[]"
              @matriz[l][c] == '{}'
            elsif @matriz[l][c] == '{*}' && instrucao[:produto] == "[]"
              @matriz[l][c] == '{*}'
            else
              @matriz[l][c] = instrucao[:produto].to_s
            end            
          end
        end
      end
    end
    @matriz
  end
  
  def healthy_crop()
    resultado = 0
    @matriz.each do |linha|
      linha.each do |item|
        tem = false 
        @combination.each do |elem|
          if item == elem
            tem = true
          end
        end
        resultado += 1 if tem
      end
    end
    resultado
  end
end

plantation = Plantation.new(instructions, plantation_size)
puts "plantation_MAP:"
the_map = plantation.set_crop
the_map.each do |linha|
  puts linha.inspect
end
puts "combinação_esperada = #{plantation.healthy_crop}"

# plantation_map = 
# [[" ",  "*",   "[*]", "[]",  "[]",  "[]"],
#  ["{}", "{*}", "{*}", "{}",  "[]",  "[]"],
#  ["{}", "{*}", "{*}", "{+}", "[+]", "[+]"],
#  ["{}", "{*}", "{*}", "{+}", "[+]", "[+]"],
#  ["{}", "{*}", "{*}", "{+}", "[+]", "[+]"],
#  ["{}", "{*}", "{*}", "{+}", "+",   "+"]]
# combinação_esperada = 16




