require "byebug"


class Array 

    def times(&block)

        length = self.length 
        i = 0 
        while i < length
            block.call(self[i])
            i +=1 
        end 
    end 

    
    def my_select(&prc)
        select_arr = []
        self.times() do |i|
            select_arr << i if prc.call(i)
        end
        select_arr
    end


    def my_reject(&prc)
        select_arr = []
        self.times() do |i|
            select_arr << i if !prc.call(i)
        end
        select_arr
    end

    def my_any?(&prc)
        self.times() do |i|
            return true if prc.call(i)
        end
    return false
    end 


    def my_all?(&prc)
        self.times() do |i|
            return false if !prc.call(i)
        end
    return true
    end 


    # def my_flatten(arr)
        
    #     if arr.type == int
    #         return [arr]
            
    #     end 


    def my_zip(*args)
        res = []
        self.length.times do |i|
            miniArr = []
            
            miniArr << self[i]
            (args[0].length - 1).times do |j|
                miniArr << args[j][i]
            end
            res << miniArr 

        end
        res 
    end 

    a = [ 4, 5, 6 ]
    b = [ 7, 8, 9 ]
    p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
    
    c = [10, 11, 12]
    d = [13, 14, 15]
    [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]





end 