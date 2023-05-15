


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


    def my_reject(&prc)
        select_arr = []
        self.my_each() do |i|
            select_arr << i if !prc.call(i)
        end
        select_arr
    end

    def my_any?(&prc)
        self.my_each() do |i|
            return true if prc.call(i)
        end
    return false
    end 


    def my_all?(&prc)
        self.my_each() do |i|
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
        (0...self.length).my_each do |i|
            args.my_each do |j|
                res[i] << args[i][j]
            end 

        end
        res 
    end 

    a = [ 4, 5, 6 ]
    b = [ 7, 8, 9 ]
    [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
    
    c = [10, 11, 12]
    d = [13, 14, 15]
    [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]





end 