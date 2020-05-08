array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def my_map(array)

newarr = []
i=0
  while i < array.size
    newarr.push(yield(array[i]))
    i+=1
  end
  puts newarr
end

my_map(array) {|x| x+1}