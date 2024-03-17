class MemoryManager
  def enqueue(memory)    
    filas = memory.split("\n")
    filas.map! {|item| item.split}
    nucleo = Array.new(filas.length) { [] }
    total_memoria = []
    qtd_tasks = filas[0].length
    contador = 0
    tasks = []
    tempo_tasks = []
    memoria_task = 0
    index_nucleo_menor_tempo = nil

    qtd_tasks.times do
      puts ''
      puts "contador: #{contador += 1} de #{qtd_tasks}"      
    

      #### REMOVE E SEPARA AS PRIMEIRAS TASK DA FILA
      filas.each do |fila|
        tasks << task = fila.shift       
      end  
      puts "filas: "
      filas.each do |fila|
        puts fila.inspect
      end
      puts "tasks separadas: #{tasks}"
      ######
      
      
      ### INSERE NO NUCLEO NOVO
      nucleo.each do |fila_nucleo|
        if fila_nucleo.length == 0
          fila_nucleo << tasks.shift 
        else
          nucleo[index_nucleo_menor_tempo] << tasks.shift 
          puts "nucleo: "
          nucleo.each do |fila|
            puts fila.inspect
          end              
        end


        ### CALCULA MENOR TEMPO E SETA INDEX
        nucleo.each do |fila|
          fila.each do |task|
            memoria_task += task.split(":")[1].to_i
          end
          tempo_tasks << memoria_task
          memoria_task = 0
        end    
        index_nucleo_menor_tempo = tempo_tasks.index(tempo_tasks.min)
        puts  "tempos de exec: #{tempo_tasks.inspect }"     
        puts "index menor temp: #{index_nucleo_menor_tempo}"
        tempo_tasks = []
        ##########
      end
    end





    puts ''
    nucleo_formatado = nucleo.map do |fila|
      fila.map { |task| task.split(':')[0] }.join(' ')
    end
    
    nucleo_formatado.join("\n")
##fim func e class
  end
end

memory = <<~MEMORYTASKS.chomp
A123:50 A456:20 A789:30 A234:10
B123:10 B456:10 B789:120 B234:20
C123:30 C456:40 C789:40 C234:100
MEMORYTASKS


# A123 B789
# B123 A456 B456 A789 C789
# C123 C456 A234 B234 C234


MemoryManager.new.enqueue(memory)