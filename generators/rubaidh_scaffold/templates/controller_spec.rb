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
  def mock_<%= file_name %>(stubs={})
    @mock_<%= file_name %> ||= mock_model(<%= class_name %>, stubs)
  end

  describe "responding to GET index" do
    before(:each) do
      @<%= table_name %> = [mock_<%= file_name %>]
      <%= class_name %>.stub!(:find).and_return(@<%= table_name %>)
    end

    def do_get(params = {})
      get :index, params
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render the index template" do
      do_get
      response.should render_template(:index)
    end

    it "should query the model for a list of <%= table_name %>" do
      <%= class_name %>.should_receive(:find).with(:all).and_return([mock_<%= file_name %>])
      do_get
    end

    it "should expose all <%= table_name %> as @<%= table_name %>" do
      do_get
      assigns[:<%= table_name %>].should == [mock_<%= file_name %>]
    end
  end

  describe "responding to GET show" do
    before(:each) do
      <%= class_name %>.stub!(:find).and_return(mock_<%= file_name %>)
    end

    def do_get(params = {})
      get :show, { :id => "37" }.merge(params)
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render the show template" do
      do_get
      response.should render_template(:show)
    end

    it "should query the model for the requested <%= file_name %>" do
      <%= class_name %>.should_receive(:find).with("37").and_return(mock_<%= file_name %>)
      do_get
    end

    it "should expose the requested <%= file_name %> as @<%= file_name %>" do
      do_get
      assigns[:<%= file_name %>].should equal(mock_<%= file_name %>)
    end
  end

  describe "responding to GET new" do
    before(:each) do
      <%= class_name %>.stub!(:new).and_return(mock_<%= file_name %>)
    end

    def do_get(params = {})
      get :new, params
    end

    it "should ask the model for a new <%= file_name %>" do
      <%= class_name %>.should_receive(:new).and_return(mock_<%= file_name %>)
      do_get
    end

    it "should expose a new <%= file_name %> as @<%= file_name %>" do
      get :new
      assigns[:<%= file_name %>].should equal(mock_<%= file_name %>)
    end
  end

  describe "responding to GET edit" do
    before(:each) do
      <%= class_name %>.stub!(:find).and_return(mock_<%= file_name %>)
    end

    def do_get(params = {})
      get :edit, { :id => "37" }.merge(params)
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render the edit template" do
      do_get
      response.should render_template(:edit)
    end

    it "should query the model for the requested <%= file_name %>" do
      <%= class_name %>.should_receive(:find).with("37").and_return(mock_<%= file_name %>)
      do_get
    end

    it "should expose the requested <%= file_name %> as @<%= file_name %>" do
      do_get
      assigns[:<%= file_name %>].should equal(mock_<%= file_name %>)
    end
  end

  describe "responding to POST create" do
    before(:each) do
      <%= class_name %>.stub!(:new).and_return(mock_<%= file_name %>)
      mock_<%= file_name %>.stub!(:save)
    end

    def do_post(params = {})
      post :create, { :<%= file_name %> => { "dummy" => "parameters" } }.merge(params)
    end

    it "should build a new <%= file_name %> with the supplied parameters" do
      <%= class_name %>.should_receive(:new).with({ "dummy" => "parameters" })
      do_post
    end

    it "should attempt to save the new <%= file_name %>" do
      mock_<%= file_name %>.should_receive(:save)
      do_post
    end

    describe "with valid params" do
      before(:each) do
        mock_<%= file_name %>.stub!(:save).and_return(true)
      end

      it "should redirect to the created <%= file_name %>" do
        do_post
        response.should redirect_to(<%= file_name %>_url(mock_<%= file_name %>))
      end
    end

    describe "with invalid params" do
      before(:each) do
        mock_<%= file_name %>.stub!(:save).and_return(false)
      end

      it "should expose a newly created but unsaved <%= file_name %> as @<%= file_name %>" do
        do_post
        assigns(:<%= file_name %>).should equal(mock_<%= file_name %>)
      end

      it "should re-render the 'new' template" do
        do_post
        response.should render_template('new')
      end
    end
  end

  describe "responding to PUT udpate" do
    before(:each) do
      <%= class_name %>.stub!(:find).and_return(mock_<%= file_name %>)
      mock_<%= file_name %>.stub!(:update_attributes)
    end

    def do_put(params = {})
      put :update, { :id => "37", :<%= file_name %> => { "dummy" => "parameters" } }.merge(params)
    end

    it "should query the model for the requested <%= file_name %>" do
      <%= class_name %>.should_receive(:find).with("37").and_return(mock_<%= file_name %>)
      do_put
    end

    it "should attempt to update the attributes of the requested <%= file_name %>" do
      mock_<%= file_name %>.should_receive(:update_attributes).with({ "dummy" => "parameters" })
      do_put
    end

    describe "with valid params" do
      before(:each) do
        mock_<%= file_name %>.stub!(:update_attributes).and_return(true)
      end

      it "should redirect to the <%= file_name %>" do
        do_put
        response.should redirect_to(<%= file_name %>_url(mock_<%= file_name %>))
      end
    end

    describe "with invalid params" do
      before(:each) do
        mock_<%= file_name %>.stub!(:update_attributes).and_return(false)
      end

      it "should expose the <%= file_name %> as @<%= file_name %>" do
        do_put
        assigns(:<%= file_name %>).should equal(mock_<%= file_name %>)
      end

      it "should re-render the 'edit' template" do
        do_put
        response.should render_template('edit')
      end
    end

  end

  describe "responding to DELETE destroy" do
    before(:each) do
      <%= class_name %>.stub!(:find).and_return(mock_<%= file_name %>)
      mock_<%= file_name %>.stub!(:destroy)
    end

    def do_delete(params = {})
      delete :destroy, { :id => "37" }.merge(params)
    end

    it "should query the model for the requested <%= file_name %>" do
      <%= class_name %>.should_receive(:find).with("37").and_return(mock_<%= file_name %>)
      do_delete
    end

    it "should destroy the requested <%= file_name %>" do
      mock_<%= file_name %>.should_receive(:destroy)
      do_delete
    end

    it "should redirect to the <%= table_name %> list" do
      do_delete
      response.should redirect_to(<%= table_name %>_url)
    end
  end
end
