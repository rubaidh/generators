# <%= class_name %> Controller
#
# Created on <%= Time.now.to_s :long %> by <%= user_full_name %> as part
# of the "<%= project_name %>" project.
#
#--
# Copyright (c) 2006-<%= Time.now.year %> Rubaidh Ltd.  All rights reserved.
# See LICENSE in the top level source code folder for permissions.
#++

class <%= class_name %>Controller < ApplicationController
<% for action in actions -%>

  def <%= action %>
  end
<% end -%>
end
