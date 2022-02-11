
class Item
    attr_writer :title, :description
    attr_reader :title, :deadline, :description

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline if Item.valid_date?(deadline)
        @description = description

    end 

   def self.valid_date?(date_string)
    split = date_string.split("-")
    if split[1].to_i > 12 
        raise "that doesn't work"
        return false
    elsif split[-1].to_i > 31
        raise "that doesn't work"
        return false
    end 
    true
   end 

   def deadline=(new_deadline)
     @deadline = new_deadline if Item.valid_date?(new_deadline)
   end 

 

end 



# p my_item = Item.new('Fix login page', '2019-10-42', 'It loads slow.')
p my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
# p my_item.title
# p my_item.description = 'It loads waaaaaay too slow!'

# my_item.deadline = "2019-10-23"
# p my_item.deadline 
# p my_item

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false