def my_uniq(arr)
  arr.uniq
end 

def two_sum(arr)
  raise "u suck" if arr.length < 2
  result = []
  arr.each_with_index do |el,i|
    arr.each_with_index do |el1,j|
        result << [i,j].sort if el+el1 == 0 && i != j
    end
  end
  result.uniq
end

def my_transpose(matrix)
  transposed = []
  matrix.each_with_index do |el,i|
    row = []
    el.each_with_index do |el2,j|
      row << matrix[j][i]
    end
    transposed << row
  end
  transposed
end

def stock_picker(array)
  best = 0 
  best_pair = []
  array.each_with_index do |day, i|
    idx = i
    while i < array.length
      thing = array[i] - day 
      if thing > best
        best_pair = [idx, i]
        best = thing
      end 
      i+=1
    end 
  end 
  return nil if best_pair.empty?
  best_pair
end 


