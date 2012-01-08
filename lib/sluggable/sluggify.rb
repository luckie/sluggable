module Sluggable
  module Sluggify
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def sluggify(attr, options={})
        slugged_attr = (options[:as] || :slug).to_s
        scope =  options.has_key?(:scope) ? ", scope: :#{options[:scope]}" : ''

        class_eval <<-EOP
         validates_uniqueness_of :#{slugged_attr}#{scope} 

          def #{attr}=(value)
            write_attribute(:#{slugged_attr}, value.gsub('&', 'and').parameterize) unless #{slugged_attr}?
            super
          end
        EOP
      end
    end
  end
end

