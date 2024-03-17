class HomeworkSolver

  def initialize(exercise_path)
    @exercise_path = exercise_path
  end

  def solve(answer_sheet_path)
    homework = ler(@exercise_path)
    n = ''
    for q in homework do
      res = calcular(q)
      escrever(answer_sheet_path, n)
      escrever(answer_sheet_path, res)
      n = "\n"
    end    
  end

  def ler(path_exe)
    conteudo = ''
    File.open(path_exe, 'r') do |file|
    conteudo << file.read()
    end

    array = conteudo.split("\n")
    return array
  end

  def calcular(exe)
    resultado = 0
    operador = ''
    array = exe.split
    for item in array do      
      if item != '+' && item != '-' && item != '*' && item != '/' && operador == ''
        resultado += item.to_i
      elsif item == '+' || item == '-' || item == '*' || item == '/'
          operador = item
      elsif item != '+' && item != '-' && item != '*' && item != '/'
          if operador == '+' 
            resultado += item .to_i
          elsif operador == '-' 
            resultado -= item.to_i          
          elsif operador == '*' 
            resultado *= item .to_i         
          elsif operador == '/' 
            resultado /= item.to_i
          end         
      end        
    end 
    return resultado
  end

  def escrever(path_sheet, txt)
    File.open(path_sheet, 'a') do |file|
      file.print txt
    end
  end

end
