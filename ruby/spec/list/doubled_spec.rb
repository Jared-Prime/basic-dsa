require 'pry'
require './lib/list/doubled'
require './lib/list/node'

describe List::Doubled do
  subject{ described_class.new }


  describe '#each' do
    it 'detects a loop, stopping iteration' do
      iterations = 0
      subject.insert 'June'
      subject.each{ iterations += 1 }
      expect(iterations).to eq 1
    end
  end
end
