# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(data)
    @value = data
    @next_node = nil
  end
end
