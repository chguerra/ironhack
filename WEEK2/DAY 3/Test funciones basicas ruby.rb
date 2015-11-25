require 'pry'

class Array
    def my_each_with_index
        i = 0
        while i < self.size
        yield(self[i],i)
        i += 1
    end
    self
    end

    def my_select 
        i = 0
        result = []
        while i < self.size
        if yield(self[i]) == true
            result << self[i]
            i += 1
        else
            i += 1
        end
    end
    result
    end


    def my_map
        i = 0
        result = []
        while i < self.size
            result << yield(self[i])
            i += 1
        end
        result
    end
end

my_proc = Proc.new {|n| n*6 }

a = [1, 2, 3, 3, 4, 5, 7].my_map &my_proc

puts a