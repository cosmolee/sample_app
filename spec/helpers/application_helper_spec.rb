require 'spec_helper'

#Ex 5.6.3

#Michael:

#This exercize is confusing.  Not sure what is being accomplished here?  The code in listing 5.37 doesn't seem to be accomplishing anything.  Indeed, completely commenting out the code in 5.37 allows the test to run successfully!

# 05/05/2012: Answer: This is testing the viability of the ~/app/helpers/application_helper.rb#full_title() method.  

# Odd: including this file from "utility.rb" allows the rspec tests to call `full_title()` directly from the application code, with no need for a duplicate method originally provided by "utility.rb".  This, even though no `full_title()` method is defined here.  You can test this out by commenting out ALL code in this file and running the rspec tests successfully without any errors flagging `full_title()` as undefined...


describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base title" do
      full_title("foo").should =~ /^Ruby on Rails Tutorial Sample App/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end
  end
end



