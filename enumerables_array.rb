


class Array 

    def my_each(&block)

        length = self.length 
        i = 0 
        while i < length
            block.call(self[i])
            i +=1 
        end 
    end 

    
    def my_select(&prc)
        select_arr = []
        self.my_each() do |i|
            select_arr << i if prc.call(i)
        end
        select_arr
    end


    
    return_value = [1, 2, 3].my_each do |num|
    puts num
    end.my_each do |num|
    puts num
    end
   # => 1
   #    2
   #    3
   #    1
   #    2
   #    3
   
   p return_value  # => [1, 2, 3]
   
   
end 

