require_relative '../../spec_helper'
require 'resolv'

describe "Resolv#getname" do
  platform_is_not :windows do
    it "resolves 127.0.0.1" do
      hosts = Resolv::Hosts.new(fixture(__FILE__ , "hosts"))
      res = Resolv.new([hosts])

      res.getname("127.0.0.1").should == "localhost"
    end
  end

  it "raises ResolvError when there is no result" do
    res = Resolv.new([])
    lambda {
      res.getname("should.raise.error")
    }.should raise_error(Resolv::ResolvError)
  end
end
