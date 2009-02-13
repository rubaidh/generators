# <%= class_name %> Specification
#
# Created on <%= Time.now.to_s :long %> by <%= user_full_name %> as part
# of the "<%= project_name %>" project.
#
#--
# Copyright (c) 2006-<%= Time.now.year %> Rubaidh Ltd.  All rights reserved.
# See LICENSE in the top level source code folder for permissions.
#++

require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper')

describe <%= class_name %> do
  describe "generator" do
    it "should successfully create a new instance" do
      lambda { <%= class_name %>.generate! }.should_not raise_error
    end

    it "should persist the new instance in the database" do
      lambda { <%= class_name %>.generate }.should change(<%= class_name %>, :count).by(1)
    end

    it "should be valid" do
      <%= class_name %>.generate.should be_valid
    end
  end

  describe "validations" do

  end
end
