class PotionShop
  attr_reader :potions, :stock_ingredients

  def initialize(potions, stock_ingredients)
    @potions = potions
    @stock_ingredients = stock_ingredients
    @order_delivered = { }
  end

  def sell(customers)
    cliente_lista = filtra_cliente(customers)
    if cliente_lista.nil?
      return @order_delivered
    end

    hash_ingr_por_cliente = Hash.new(0)
    cliente_lista.each do |key_cliente, hash_pedido|
      hash_ingr_total = Hash.new(0)
      hash_pedido.each do |key_pot, value_qtdd_pot|
          hash_dados_pot = @potions[key_pot]
          if hash_dados_pot.nil?
            next
          end
          hash_dados_pot.each do |ingr, value_qtdd_ingr|
            hash_ingr_total[ingr] += value_qtdd_ingr * value_qtdd_pot
          end
      end
      hash_ingr_por_cliente[key_cliente] = hash_ingr_total
    end

    hash_ingr_por_cliente_ord_por_preco = hash_ingr_por_cliente.sort_by { |_, v| -v[:price] }.to_h

    hash_ingr_por_cliente_ord_por_preco.each do |key_cliente, hash_value|
      suficiente = true;
      preco = hash_value[:price]   
      hash_value.each do |key_ingr, value_qtdd|
          if key_ingr != :price
            if @stock_ingredients[key_ingr].to_i < value_qtdd
                suficiente = false
            end            
          end
      end
      if suficiente 
          @order_delivered[key_cliente] = preco
          return @order_delivered 
      end
    end
    @order_delivered
  end

  def filtra_cliente(customers)
    ok = {}
    customers.each do |customer, orders|
       orders.each do |potion, quantity|
          if !@potions.key?(potion) || ok.any? { |c, _| c == customer }
             break
          end
          ok[customer] = orders
       end
    end
    ok
 end
end


