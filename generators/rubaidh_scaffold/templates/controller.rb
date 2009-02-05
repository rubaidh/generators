# <%= class_name %> Controller
#
# Created on <%= Time.now.to_s :long %> by <%= user_full_name %> as part
# of the "<%= project_name %>" project.
#
#--
# Copyright (c) 2006-<%= Time.now.year %> Rubaidh Ltd.  All rights reserved.
# See LICENSE in the top level source code folder for permissions.
#++

class <%= controller_class_name %>Controller < ApplicationController
  def index
    @<%= table_name %> = <%= class_name %>.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @<%= file_name %> = <%= class_name %>.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @<%= file_name %> = <%= class_name %>.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @<%= file_name %> = <%= class_name %>.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  def create
    @<%= file_name %> = <%= class_name %>.new(params[:<%= file_name %>])

    respond_to do |format|
      if @<%= file_name %>.save
        format.html { redirect_to(@<%= file_name %>) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @<%= file_name %> = <%= class_name %>.find(params[:id])

    respond_to do |format|
      if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
        format.html { redirect_to(@<%= file_name %>) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @<%= file_name %> = <%= class_name %>.find(params[:id])
    @<%= file_name %>.destroy

    respond_to do |format|
      format.html { redirect_to(<%= table_name %>_url) }
    end
  end
end
