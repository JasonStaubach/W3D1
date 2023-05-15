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
            (self.length - 1).times do |j|
                miniArr << args[j][i]
            end
            res << miniArr 

        end
        res 
    end 

    def my_rotate(num=1)
        res = []
        fin_arr = Array.new(self.length)
        (0...self.length).each do |i|
            res << (i + num) % self.length 
        
        end
        
        (0...self.length).each do |j|
            fin_arr[self[res[j]]] << self[j]
        end 


        fin_arr
    end 

        

    def my_join(sep="")
        res = ""
        self.each do |i|
            res+= i 
            res+= sep
        end 
        res 
    end 



    def my_reverse
        res = []

        length = self.length
        while length > 0
            res << self[length-1]
            length -=1 
        end
        res 
    end 

end 
