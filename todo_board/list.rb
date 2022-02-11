
class List
      # print styles
    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10


    require_relative "item.rb"
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end 

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else 
            false
        end
    end 

    def size
        @items.length
    end 

    def valid_index?(index)
        return false if index < 0
        return false if index > self.size-1
        true 
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else 
            false
        end 
    end 

    def [](index)
        if valid_index?(index)
        p @items[index]
        else 
            return nil
        end 
    end 

    def priority
        p @items[0]
    end 

    def print 
        puts "-" * LINE_WIDTH
        puts " " * 16 + @label.upcase
        puts "-" * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
        puts "-" * LINE_WIDTH
        @items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)}"
        end
        puts "-" * LINE_WIDTH
    end

  def print_full_item(index)
        item = self[index]
        return if item.nil?
        puts "-" * LINE_WIDTH
        puts "#{item.title.ljust(LINE_WIDTH/2)}#{item.deadline.rjust(LINE_WIDTH/2)}"
        puts item.description
        puts "-" * LINE_WIDTH
    end

    def print_priority
        item = self[0]
        puts "-" * LINE_WIDTH
        puts "#{item.title.ljust(LINE_WIDTH/2)}#{item.deadline.rjust(LINE_WIDTH/2)}"
        puts item.description
        puts "-" * LINE_WIDTH
    end 

    def up(index, amount)
        if valid_index?(index)
            while 
            amount.times do self.swap(index, index-1)
       end 
    end 

end 

