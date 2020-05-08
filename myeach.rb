
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def my_each(array)
 
  i=0
  while i < array.size
    yield(array[i])
    i+=1
  end 
end

my_each(array) {|x| puts x}