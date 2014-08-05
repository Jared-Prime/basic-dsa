require './lib/queue'

class QStack
  attr_accessor :primary, :secondary

  def initialize
    @primary, @secondary = Queue.new, Queue.new
  end

  def push(data)
    swap! unless @primary.empty?
    @primary.push data
    transfer!
  end

  def pop
    if @primary.empty?
      @secondary.pop
    else 
      @primary.pop
    end
  end

  private

  def swap!
    @secondary, @primary = @primary, @secondary
  end

  def transfer!
    until @secondary.empty?
      @primary.push @secondary.pop
    end
  end
end
