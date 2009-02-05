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

describe <%= class_name %>Controller do
<% unless actions.empty? -%>
<% for action in actions -%>

  describe "responding to GET '<%= action %>'" do
    def do_get
      get :<%= action %>
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  end
<% end -%>
<% end -%>
end
