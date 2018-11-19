RailsAdmin.config do |config|
  config.parent_controller = "ApplicationController"
  config.main_app_name = ["Morning Speech Management System"]

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancancan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard do                  # mandatory
      statistics false
    end
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model "Location" do
    edit do
      field :name
    end
  end

  # Navigation
  config.excluded_models += %w(Relationship Service SpeechTheme)

  config.model User do
    list do
      field :location_id
      field :name
      field :staff_id
      field :position
      field :division
      field :group
      field :roles
      field :speeches
      field :email
    end
  end
  config.model Speech do
    list do
      field :location
      field :speaking_day
      field :user
      field :title
      field :themes
      field :status
    end
  end
  config.model Theme do
    list do
      field :title
      field :speeches
    end
  end
  config.model Location do
    list do
      field :name
      field :speeches
    end
  end
  config.model Role do
    list do
      field :name
      field :users
    end
  end
end
