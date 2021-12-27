def stock_picker(prices)
  backup_prices = prices
  checker = ""
  min = nil
  meta_possibilities = []
  index = []
  prices.length.times do
    min = prices.min
    possibilities = prices.select { |price| price > min && prices.find_index(price) > prices.find_index(min) }
    possibilities.map! do |possibility|
      index.push([prices.find_index(possibility), prices.find_index(min)])
      possibility -= min
    end
    meta_possibilities.push(possibilities)
    prices.delete(min)
  end
  
  

  meta_possibilities.flatten!
  final = index[meta_possibilities.find_index(meta_possibilities.max)]
end

stock_picker([17,3,6,9,15,8,6,1,10])