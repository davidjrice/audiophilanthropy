require File.dirname(__FILE__) + '/spec_helper'

describe Audiophilanthropy::Format do
  
  describe "with multiple extensions and content types (aiff/aif)" do
    
    before(:each) do
      @format = Audiophilanthropy::Format.new( [:aiff, :aif], ["audio/aiff", "audio/x-aiff"] )
    end
    
    it "content_type should be 'audio/aiff'" do
      @format.content_type.should == "audio/aiff"
    end
    
    it "extension should be .aiff" do
      @format.extension.should == ".aiff"
    end
    
    it "is aiff" do
      @format.is?(:aiff).should be_true
    end
    
    it "is aif" do
      @format.is?(:aif).should be_true
    end
    
  end
  
  describe "with one extension and content type (flac)" do
    
    before(:each) do
      @format = Audiophilanthropy::Format.new( :flac, "audio/x-flac" )
    end
    
    it "is flac" do
      @format.is?(:flac).should be_true
    end
    
    it "extension should be .flac" do
      @format.extension.should == ".flac"
    end
    
    it "content_type should be 'audio/x-flac'" do
      @format.content_type.should == "audio/x-flac"
    end
    
  end
  
end


