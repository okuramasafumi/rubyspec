require_relative '../../spec_helper'

describe 'TracePoint#inspect' do
  it 'returns a string containing a human-readable TracePoint status' do
    TracePoint.new(:line) {}.inspect.should ==
      '#<TracePoint:disabled>'
  end

  it 'returns a String showing the event, path and line' do
    inspect = nil
    line = __LINE__
    TracePoint.new(:line) { |tp| inspect = tp.inspect }.enable do
      inspect.should == "#<TracePoint:line@#{__FILE__}:#{line+2}>"
    end
  end
end
