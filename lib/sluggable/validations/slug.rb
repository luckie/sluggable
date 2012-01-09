module Sluggable
  module Validations
    class SlugValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors[attribute] << 'can only contain letters, numbers, and hyphens' unless /\A[\w\d\-]+\Z/.match(value)
        record.errors[attribute] << 'can not start with a hyphen' unless /\A[^\-]/.match(value)
        record.errors[attribute] << 'can not end with a hyphen' unless /[^\-]\Z/.match(value)
      end
    end
  end
end
