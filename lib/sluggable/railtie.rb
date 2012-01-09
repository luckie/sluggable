module Sluggable
  class Railtie < Rails::Railtie
    initializer 'sluggable.configure_rails_initialization' do
      ActiveModel::Validations.send :include, Sluggable::Validations
      ActiveRecord::Base.send :include, Sluggable::Sluggify
    end
  end
end
