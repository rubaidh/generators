require 'grit'

class RubaidhNamedBase < Rails::Generator::NamedBase
  attr_reader :project_name, :user_full_name

  def initialize(runtime_args, runtime_options = {})
    super

    assign_additional_names!
  end

  private
  def assign_additional_names!
    @user_full_name = figure_out_full_name_from_git_repository
    @project_name = figure_out_project_name_from_rails_root
  end

  def figure_out_full_name_from_git_repository
    repos = Grit::Repo.new(RAILS_ROOT)

    repos.config['user.name']
  rescue StandardError => e
    # If Grit::Repo raises an error, chances are it's not a git repository. 
    # It's not super-important, so just give up.
    "a Rubaidh staff member"
  end

  def figure_out_project_name_from_rails_root
    File.basename(RAILS_ROOT).humanize
  end
end