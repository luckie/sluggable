module Sluggable
  class Railtie < Rails::Railtie
    initializer 'sluggable.configure_rails_initialization' do
      ActiveRecord::Validations.send :include, Sluggable::Validations
      ActiveRecord::Base.send :include, Sluggable::Sluggify
    end
  end
end
