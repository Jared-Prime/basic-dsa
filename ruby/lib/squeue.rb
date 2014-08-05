require './lib/stack'

class SQueue
  attr_accessor :primary, :secondary

  def initialize
    @primary, @secondary = Stack.new, Stack.new
  end

  def push(data)
    @primary.push data
  end

  def pop
    transfer!
    @secondary.pop
  end

  private

  def transfer!
    return unless @secondary.empty?
    until @primary.empty?
      @secondary.push @primary.pop
    end
  end
end
