# <%= class_name %> Controller Spec
#
# Created on <%= Time.now.to_s :long %> by <%= user_full_name %> as part
# of the "<%= project_name %>" project.
#
#--
# Copyright (c) 2006-<%= Time.now.year %> Rubaidh Ltd.  All rights reserved.
# See LICENSE in the top level source code folder for permissions.
#++

require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper')

describe <%= controller_class_name %>Controller do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "<%= table_name %>", :action => "index").should == "/<%= table_name %>"
    end

    it "should map #new" do
      route_for(:controller => "<%= table_name %>", :action => "new").should == "/<%= table_name %>/new"
    end

    it "should map #create" do
      route_for(:controller => "<%= table_name %>", :action => "create").should == { :path => "/<%= table_name %>", :method => :post }
    end

    it "should map #show" do
      route_for(:controller => "<%= table_name %>", :action => "show", :id => 1).should == "/<%= table_name %>/1"
    end

    it "should map #edit" do
      route_for(:controller => "<%= table_name %>", :action => "edit", :id => 1).should == "/<%= table_name %>/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "<%= table_name %>", :action => "update", :id => 1).should == "/<%= table_name %>/1"
    end

    it "should map #destroy" do
      route_for(:controller => "<%= table_name %>", :action => "destroy", :id => 1).should == "/<%= table_name %>/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/<%= table_name %>").should == {:controller => "<%= table_name %>", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/<%= table_name %>/new").should == {:controller => "<%= table_name %>", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/<%= table_name %>").should == {:controller => "<%= table_name %>", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/<%= table_name %>/1").should == {:controller => "<%= table_name %>", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/<%= table_name %>/1/edit").should == {:controller => "<%= table_name %>", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/<%= table_name %>/1").should == {:controller => "<%= table_name %>", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/<%= table_name %>/1").should == {:controller => "<%= table_name %>", :action => "destroy", :id => "1"}
    end
  end
end
