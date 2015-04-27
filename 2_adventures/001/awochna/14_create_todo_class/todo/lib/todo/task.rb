module Todo
  class Task

    attr_accessor :priority, :text, :done, :added, :completed

    def initialize(string)
      @priority = /\(\w\)/.match(string)[0][1] if /\(\w\)/ =~ string
      if @priority
        string.gsub!(/\(\w\)\s/, "")
      end
      @text = string
      @done = false
      @added = Date.today
      @completed = nil
    end

    def to_s
      string = ""
      string += "x " if @done
      string += "(#{@priority.upcase}) " if @priority
      string += "#{@added} " if @added
      string += "#{@completed} " if @completed
      string += "#{@text}" if @text
      string
    end
  end
end
